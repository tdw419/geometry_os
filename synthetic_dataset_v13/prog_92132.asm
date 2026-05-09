; DESCRIPTION: Draws a orange rectangle at (123, 127) with width 39 and height 110.
; PLAN: r0=123(x), r1=127(y), r2=39(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 127
LDI r2, 39
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
