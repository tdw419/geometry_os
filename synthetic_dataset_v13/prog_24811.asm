; DESCRIPTION: Renders a orange disk with center (176, 150) and radius 75.
; PLAN: r0=176(x), r1=150(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 150
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
