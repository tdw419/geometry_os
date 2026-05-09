; DESCRIPTION: Renders a white disk with center (315, 209) and radius 39.
; PLAN: r0=315(x), r1=209(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 209
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
