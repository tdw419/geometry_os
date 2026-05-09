; DESCRIPTION: Renders a orange box of size 16x107 starting at (496, 72).
; PLAN: r0=496(x), r1=72(y), r2=16(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 72
LDI r2, 16
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
