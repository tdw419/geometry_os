; DESCRIPTION: Renders a orange box of size 81x56 starting at (259, 18).
; PLAN: r0=259(x), r1=18(y), r2=81(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 18
LDI r2, 81
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
