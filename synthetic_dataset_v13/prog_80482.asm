; DESCRIPTION: Renders a orange disk with center (214, 154) and radius 79.
; PLAN: r0=214(x), r1=154(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 154
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
