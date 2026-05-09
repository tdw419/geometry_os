; DESCRIPTION: Renders a orange box of size 26x10 starting at (176, 110).
; PLAN: r0=176(x), r1=110(y), r2=26(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 110
LDI r2, 26
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
