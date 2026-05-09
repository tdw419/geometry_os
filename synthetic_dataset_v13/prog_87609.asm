; DESCRIPTION: Places a red line segment connecting (146, 79) to (221, 8).
; PLAN: r0=146(x1), r1=79(y1), r2=221(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 79
LDI r2, 221
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
