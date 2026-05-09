; DESCRIPTION: Renders a green disk with center (213, 132) and radius 30.
; PLAN: r0=213(x), r1=132(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 132
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
