; DESCRIPTION: Renders a green disk with center (343, 149) and radius 71.
; PLAN: r0=343(x), r1=149(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 149
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
