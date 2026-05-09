; DESCRIPTION: Renders a blue disk with center (297, 231) and radius 23.
; PLAN: r0=297(x), r1=231(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 231
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
