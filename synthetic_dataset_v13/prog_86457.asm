; DESCRIPTION: Renders a green disk with center (217, 120) and radius 19.
; PLAN: r0=217(x), r1=120(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 120
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
