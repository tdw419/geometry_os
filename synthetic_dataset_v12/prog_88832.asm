; DESCRIPTION: Renders a orange box of size 45x36 starting at (421, 18).
; PLAN: r0=421(x), r1=18(y), r2=45(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 18
LDI r2, 45
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
