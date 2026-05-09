; DESCRIPTION: Renders a orange box of size 81x114 starting at (162, 32).
; PLAN: r0=162(x), r1=32(y), r2=81(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 32
LDI r2, 81
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
