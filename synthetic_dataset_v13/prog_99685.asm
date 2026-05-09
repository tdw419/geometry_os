; DESCRIPTION: Renders a orange box of size 47x88 starting at (314, 110).
; PLAN: r0=314(x), r1=110(y), r2=47(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 110
LDI r2, 47
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
