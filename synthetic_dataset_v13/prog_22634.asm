; DESCRIPTION: Renders a orange box of size 47x106 starting at (43, 9).
; PLAN: r0=43(x), r1=9(y), r2=47(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 9
LDI r2, 47
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
