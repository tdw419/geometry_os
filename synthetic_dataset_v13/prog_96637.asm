; DESCRIPTION: Renders a green disk with center (217, 39) and radius 30.
; PLAN: r0=217(x), r1=39(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 39
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
