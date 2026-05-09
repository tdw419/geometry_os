; DESCRIPTION: Renders a orange box of size 91x81 starting at (105, 30).
; PLAN: r0=105(x), r1=30(y), r2=91(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 30
LDI r2, 91
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
