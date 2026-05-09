; DESCRIPTION: Renders a red disk with center (272, 175) and radius 17.
; PLAN: r0=272(x), r1=175(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 175
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
