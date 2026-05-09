; DESCRIPTION: Renders a green disk with center (107, 166) and radius 32.
; PLAN: r0=107(x), r1=166(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 166
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
