; DESCRIPTION: Renders a orange disk with center (257, 117) and radius 50.
; PLAN: r0=257(x), r1=117(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 117
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
