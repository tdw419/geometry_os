; DESCRIPTION: Renders a green disk with center (66, 210) and radius 24.
; PLAN: r0=66(x), r1=210(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 210
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
