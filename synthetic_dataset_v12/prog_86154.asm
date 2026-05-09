; DESCRIPTION: Renders a orange box of size 69x107 starting at (259, 65).
; PLAN: r0=259(x), r1=65(y), r2=69(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 65
LDI r2, 69
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
