; DESCRIPTION: Renders a orange box of size 81x18 starting at (205, 43).
; PLAN: r0=205(x), r1=43(y), r2=81(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 43
LDI r2, 81
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
