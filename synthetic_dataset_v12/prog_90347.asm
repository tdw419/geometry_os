; DESCRIPTION: Places a blue line segment connecting (36, 104) to (185, 40).
; PLAN: r0=36(x1), r1=104(y1), r2=185(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 104
LDI r2, 185
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
