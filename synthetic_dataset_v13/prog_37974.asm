; DESCRIPTION: Draws a blue rectangle at (374, 101) with width 94 and height 45.
; PLAN: r0=374(x), r1=101(y), r2=94(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 101
LDI r2, 94
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
