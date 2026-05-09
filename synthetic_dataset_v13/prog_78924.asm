; DESCRIPTION: Renders a red disk with center (324, 159) and radius 11.
; PLAN: r0=324(x), r1=159(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 159
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
