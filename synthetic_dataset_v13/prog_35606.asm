; DESCRIPTION: Draws a orange rectangle at (266, 127) with width 20 and height 34.
; PLAN: r0=266(x), r1=127(y), r2=20(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 127
LDI r2, 20
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
