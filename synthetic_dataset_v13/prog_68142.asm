; DESCRIPTION: Renders a green disk with center (217, 178) and radius 71.
; PLAN: r0=217(x), r1=178(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 178
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
