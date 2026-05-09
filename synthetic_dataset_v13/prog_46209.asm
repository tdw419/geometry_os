; DESCRIPTION: Renders a orange disk with center (474, 50) and radius 35.
; PLAN: r0=474(x), r1=50(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 50
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
