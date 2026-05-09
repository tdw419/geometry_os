; DESCRIPTION: Renders a green disk with center (179, 21) and radius 14.
; PLAN: r0=179(x), r1=21(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 21
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
