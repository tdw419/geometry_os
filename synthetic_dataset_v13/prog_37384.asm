; DESCRIPTION: Renders a orange box of size 40x14 starting at (110, 78).
; PLAN: r0=110(x), r1=78(y), r2=40(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 78
LDI r2, 40
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
