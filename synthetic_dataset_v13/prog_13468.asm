; DESCRIPTION: Renders a black disk with center (180, 170) and radius 27.
; PLAN: r0=180(x), r1=170(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 170
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
