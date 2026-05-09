; DESCRIPTION: Renders a orange box of size 53x88 starting at (93, 131).
; PLAN: r0=93(x), r1=131(y), r2=53(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 131
LDI r2, 53
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
