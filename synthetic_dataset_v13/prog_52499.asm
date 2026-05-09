; DESCRIPTION: Renders a white box of size 52x45 starting at (421, 100).
; PLAN: r0=421(x), r1=100(y), r2=52(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 100
LDI r2, 52
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
