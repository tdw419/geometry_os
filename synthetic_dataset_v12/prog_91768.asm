; DESCRIPTION: Draws a blue rectangle at (230, 210) with width 50 and height 15.
; PLAN: r0=230(x), r1=210(y), r2=50(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 210
LDI r2, 50
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
