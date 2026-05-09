; DESCRIPTION: Renders a orange box of size 75x98 starting at (67, 101).
; PLAN: r0=67(x), r1=101(y), r2=75(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 101
LDI r2, 75
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
