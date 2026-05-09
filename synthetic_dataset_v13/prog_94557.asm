; DESCRIPTION: Renders a green disk with center (297, 206) and radius 49.
; PLAN: r0=297(x), r1=206(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 206
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
