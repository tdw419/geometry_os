; DESCRIPTION: Draws a blue rectangle at (255, 94) with width 27 and height 88.
; PLAN: r0=255(x), r1=94(y), r2=27(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 94
LDI r2, 27
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
