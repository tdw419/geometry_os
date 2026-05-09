; DESCRIPTION: Draws a green rectangle at (222, 194) with width 97 and height 50.
; PLAN: r0=222(x), r1=194(y), r2=97(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 194
LDI r2, 97
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
