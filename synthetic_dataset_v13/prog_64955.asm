; DESCRIPTION: Renders a orange box of size 70x101 starting at (84, 73).
; PLAN: r0=84(x), r1=73(y), r2=70(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 73
LDI r2, 70
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
