; DESCRIPTION: Draws a orange rectangle at (173, 69) with width 22 and height 89.
; PLAN: r0=173(x), r1=69(y), r2=22(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 69
LDI r2, 22
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
