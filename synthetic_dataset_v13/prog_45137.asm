; DESCRIPTION: Renders a orange box of size 11x119 starting at (74, 61).
; PLAN: r0=74(x), r1=61(y), r2=11(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 61
LDI r2, 11
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
