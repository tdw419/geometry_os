; DESCRIPTION: Renders a orange box of size 88x75 starting at (364, 99).
; PLAN: r0=364(x), r1=99(y), r2=88(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 99
LDI r2, 88
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
