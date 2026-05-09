; DESCRIPTION: Renders a orange box of size 99x106 starting at (213, 88).
; PLAN: r0=213(x), r1=88(y), r2=99(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 88
LDI r2, 99
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
