; DESCRIPTION: Renders a orange box of size 26x40 starting at (205, 100).
; PLAN: r0=205(x), r1=100(y), r2=26(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 100
LDI r2, 26
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
