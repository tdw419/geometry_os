; DESCRIPTION: Draws a blue rectangle at (240, 12) with width 40 and height 50.
; PLAN: r0=240(x), r1=12(y), r2=40(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 12
LDI r2, 40
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
