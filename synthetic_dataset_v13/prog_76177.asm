; DESCRIPTION: Renders a orange disk with center (420, 164) and radius 74.
; PLAN: r0=420(x), r1=164(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 164
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
