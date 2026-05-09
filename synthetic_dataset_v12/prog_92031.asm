; DESCRIPTION: Places a blue line segment connecting (249, 7) to (268, 185).
; PLAN: r0=249(x1), r1=7(y1), r2=268(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 7
LDI r2, 268
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
