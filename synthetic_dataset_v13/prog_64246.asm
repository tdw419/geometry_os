; DESCRIPTION: Places a red line segment connecting (64, 145) to (20, 46).
; PLAN: r0=64(x1), r1=145(y1), r2=20(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 145
LDI r2, 20
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
