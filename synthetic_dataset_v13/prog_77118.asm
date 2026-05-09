; DESCRIPTION: Renders a orange box of size 119x101 starting at (371, 88).
; PLAN: r0=371(x), r1=88(y), r2=119(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 88
LDI r2, 119
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
