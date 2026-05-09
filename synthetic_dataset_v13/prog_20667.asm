; DESCRIPTION: Draws a blue rectangle at (402, 34) with width 46 and height 97.
; PLAN: r0=402(x), r1=34(y), r2=46(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 34
LDI r2, 46
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
