; DESCRIPTION: Renders a orange disk with center (450, 225) and radius 18.
; PLAN: r0=450(x), r1=225(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 225
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
