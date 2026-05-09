; DESCRIPTION: Places a blue line segment connecting (15, 37) to (264, 31).
; PLAN: r0=15(x1), r1=37(y1), r2=264(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 37
LDI r2, 264
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
