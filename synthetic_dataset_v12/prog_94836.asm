; DESCRIPTION: Draws a orange rectangle at (110, 19) with width 28 and height 95.
; PLAN: r0=110(x), r1=19(y), r2=28(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 19
LDI r2, 28
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
