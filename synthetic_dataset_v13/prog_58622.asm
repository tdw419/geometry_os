; DESCRIPTION: Renders a blue disk with center (217, 125) and radius 27.
; PLAN: r0=217(x), r1=125(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 125
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
