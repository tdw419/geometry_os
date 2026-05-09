; DESCRIPTION: Renders a orange box of size 19x53 starting at (158, 16).
; PLAN: r0=158(x), r1=16(y), r2=19(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 16
LDI r2, 19
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
