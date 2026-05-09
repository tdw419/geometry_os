; DESCRIPTION: Places a blue line segment connecting (104, 6) to (274, 129).
; PLAN: r0=104(x1), r1=6(y1), r2=274(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 6
LDI r2, 274
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
