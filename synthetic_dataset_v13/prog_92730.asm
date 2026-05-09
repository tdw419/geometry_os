; DESCRIPTION: Renders a orange disk with center (102, 181) and radius 68.
; PLAN: r0=102(x), r1=181(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 181
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
