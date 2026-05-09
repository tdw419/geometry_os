; DESCRIPTION: Renders a orange box of size 30x88 starting at (6, 158).
; PLAN: r0=6(x), r1=158(y), r2=30(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 158
LDI r2, 30
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
