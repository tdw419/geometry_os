; DESCRIPTION: Draws a yellow rectangle at (324, 125) with width 24 and height 97.
; PLAN: r0=324(x), r1=125(y), r2=24(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 125
LDI r2, 24
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
