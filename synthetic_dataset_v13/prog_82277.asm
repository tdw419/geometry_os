; DESCRIPTION: Renders a orange box of size 87x114 starting at (239, 26).
; PLAN: r0=239(x), r1=26(y), r2=87(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 26
LDI r2, 87
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
