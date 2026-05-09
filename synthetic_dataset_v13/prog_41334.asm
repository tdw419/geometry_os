; DESCRIPTION: Renders a orange disk with center (173, 169) and radius 45.
; PLAN: r0=173(x), r1=169(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 169
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
