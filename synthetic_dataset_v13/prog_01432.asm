; DESCRIPTION: Renders a orange box of size 37x114 starting at (430, 22).
; PLAN: r0=430(x), r1=22(y), r2=37(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 22
LDI r2, 37
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
