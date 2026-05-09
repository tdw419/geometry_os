; DESCRIPTION: Draws a orange rectangle at (226, 2) with width 97 and height 68.
; PLAN: r0=226(x), r1=2(y), r2=97(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 2
LDI r2, 97
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
