; DESCRIPTION: Places a blue line segment connecting (486, 48) to (321, 211).
; PLAN: r0=486(x1), r1=48(y1), r2=321(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 48
LDI r2, 321
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
