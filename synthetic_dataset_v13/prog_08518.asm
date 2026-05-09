; DESCRIPTION: Places a green line segment connecting (274, 46) to (139, 230).
; PLAN: r0=274(x1), r1=46(y1), r2=139(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 46
LDI r2, 139
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
