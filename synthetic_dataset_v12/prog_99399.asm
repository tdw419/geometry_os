; DESCRIPTION: Places a blue line segment connecting (274, 17) to (425, 139).
; PLAN: r0=274(x1), r1=17(y1), r2=425(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 17
LDI r2, 425
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
