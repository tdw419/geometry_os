; DESCRIPTION: Places a red line segment connecting (115, 46) to (112, 231).
; PLAN: r0=115(x1), r1=46(y1), r2=112(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 46
LDI r2, 112
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
