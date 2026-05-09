; DESCRIPTION: Renders a orange box of size 108x69 starting at (385, 123).
; PLAN: r0=385(x), r1=123(y), r2=108(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 123
LDI r2, 108
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
