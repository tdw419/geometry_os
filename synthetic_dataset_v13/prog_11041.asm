; DESCRIPTION: Renders a white box of size 15x33 starting at (496, 181).
; PLAN: r0=496(x), r1=181(y), r2=15(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 181
LDI r2, 15
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
