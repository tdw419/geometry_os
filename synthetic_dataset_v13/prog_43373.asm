; DESCRIPTION: Renders a orange disk with center (230, 29) and radius 29.
; PLAN: r0=230(x), r1=29(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 29
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
