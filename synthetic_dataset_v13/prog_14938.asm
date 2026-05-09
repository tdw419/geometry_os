; DESCRIPTION: Places a red line segment connecting (233, 119) to (146, 46).
; PLAN: r0=233(x1), r1=119(y1), r2=146(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 119
LDI r2, 146
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
