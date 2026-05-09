; DESCRIPTION: Renders a orange box of size 74x26 starting at (231, 53).
; PLAN: r0=231(x), r1=53(y), r2=74(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 53
LDI r2, 74
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
