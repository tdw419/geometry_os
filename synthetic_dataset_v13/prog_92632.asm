; DESCRIPTION: Draws a blue rectangle at (94, 21) with width 68 and height 17.
; PLAN: r0=94(x), r1=21(y), r2=68(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 21
LDI r2, 68
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
