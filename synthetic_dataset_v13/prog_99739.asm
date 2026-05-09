; DESCRIPTION: Renders a black disk with center (203, 213) and radius 13.
; PLAN: r0=203(x), r1=213(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 213
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
