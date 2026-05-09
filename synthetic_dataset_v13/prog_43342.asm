; DESCRIPTION: Renders a orange box of size 19x119 starting at (259, 9).
; PLAN: r0=259(x), r1=9(y), r2=19(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 9
LDI r2, 19
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
