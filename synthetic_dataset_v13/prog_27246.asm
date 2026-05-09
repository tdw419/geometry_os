; DESCRIPTION: Places a blue line segment connecting (175, 89) to (276, 5).
; PLAN: r0=175(x1), r1=89(y1), r2=276(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 89
LDI r2, 276
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
