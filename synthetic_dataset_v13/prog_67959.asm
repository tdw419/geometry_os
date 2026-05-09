; DESCRIPTION: Draws a orange rectangle at (127, 216) with width 115 and height 28.
; PLAN: r0=127(x), r1=216(y), r2=115(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 216
LDI r2, 115
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
