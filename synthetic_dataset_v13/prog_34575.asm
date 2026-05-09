; DESCRIPTION: Draws a blue rectangle at (60, 97) with width 99 and height 87.
; PLAN: r0=60(x), r1=97(y), r2=99(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 97
LDI r2, 99
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
