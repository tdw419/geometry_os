; DESCRIPTION: Draws a orange rectangle at (19, 226) with width 54 and height 22.
; PLAN: r0=19(x), r1=226(y), r2=54(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 226
LDI r2, 54
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
