; DESCRIPTION: Renders a orange box of size 69x56 starting at (103, 123).
; PLAN: r0=103(x), r1=123(y), r2=69(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 123
LDI r2, 69
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
