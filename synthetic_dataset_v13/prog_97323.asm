; DESCRIPTION: Renders a orange disk with center (148, 150) and radius 10.
; PLAN: r0=148(x), r1=150(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 150
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
