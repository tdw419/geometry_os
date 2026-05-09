; DESCRIPTION: Renders a orange box of size 64x101 starting at (339, 137).
; PLAN: r0=339(x), r1=137(y), r2=64(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 137
LDI r2, 64
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
