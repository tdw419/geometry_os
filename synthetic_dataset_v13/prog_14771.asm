; DESCRIPTION: Renders a black disk with center (50, 209) and radius 43.
; PLAN: r0=50(x), r1=209(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 209
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
