; DESCRIPTION: Renders a orange box of size 74x78 starting at (22, 138).
; PLAN: r0=22(x), r1=138(y), r2=74(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 138
LDI r2, 74
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
