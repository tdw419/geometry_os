; DESCRIPTION: Places a red line segment connecting (28, 79) to (185, 200).
; PLAN: r0=28(x1), r1=79(y1), r2=185(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 79
LDI r2, 185
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
