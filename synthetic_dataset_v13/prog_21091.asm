; DESCRIPTION: Renders a white disk with center (230, 195) and radius 27.
; PLAN: r0=230(x), r1=195(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 195
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
