; DESCRIPTION: Renders a orange box of size 23x113 starting at (390, 88).
; PLAN: r0=390(x), r1=88(y), r2=23(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 88
LDI r2, 23
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
