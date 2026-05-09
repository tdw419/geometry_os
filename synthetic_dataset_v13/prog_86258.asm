; DESCRIPTION: Renders a orange box of size 49x105 starting at (35, 34).
; PLAN: r0=35(x), r1=34(y), r2=49(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 34
LDI r2, 49
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
