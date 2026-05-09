; DESCRIPTION: Renders a green disk with center (217, 149) and radius 66.
; PLAN: r0=217(x), r1=149(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 149
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
