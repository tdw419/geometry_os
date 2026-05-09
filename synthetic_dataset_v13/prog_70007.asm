; DESCRIPTION: Renders a green disk with center (394, 81) and radius 67.
; PLAN: r0=394(x), r1=81(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 81
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
