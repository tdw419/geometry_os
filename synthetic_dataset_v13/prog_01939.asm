; DESCRIPTION: Draws a orange rectangle at (388, 188) with width 98 and height 25.
; PLAN: r0=388(x), r1=188(y), r2=98(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 188
LDI r2, 98
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
