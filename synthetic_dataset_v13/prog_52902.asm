; DESCRIPTION: Renders a orange box of size 74x57 starting at (26, 49).
; PLAN: r0=26(x), r1=49(y), r2=74(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 49
LDI r2, 74
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
