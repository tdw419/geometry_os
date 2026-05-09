; DESCRIPTION: Draws a blue rectangle at (220, 167) with width 21 and height 14.
; PLAN: r0=220(x), r1=167(y), r2=21(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 167
LDI r2, 21
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
