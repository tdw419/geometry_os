; DESCRIPTION: Renders a orange box of size 106x26 starting at (234, 203).
; PLAN: r0=234(x), r1=203(y), r2=106(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 203
LDI r2, 106
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
