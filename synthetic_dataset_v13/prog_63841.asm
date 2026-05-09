; DESCRIPTION: Renders a orange disk with center (308, 165) and radius 79.
; PLAN: r0=308(x), r1=165(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 165
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
