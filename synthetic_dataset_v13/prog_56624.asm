; DESCRIPTION: Renders a orange disk with center (371, 88) and radius 15.
; PLAN: r0=371(x), r1=88(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 88
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
