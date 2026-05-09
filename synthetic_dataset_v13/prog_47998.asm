; DESCRIPTION: Renders a orange box of size 101x38 starting at (105, 26).
; PLAN: r0=105(x), r1=26(y), r2=101(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 26
LDI r2, 101
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
