; DESCRIPTION: Renders a orange box of size 96x61 starting at (88, 81).
; PLAN: r0=88(x), r1=81(y), r2=96(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 81
LDI r2, 96
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
