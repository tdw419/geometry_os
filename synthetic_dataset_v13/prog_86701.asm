; DESCRIPTION: Draws a blue rectangle at (213, 9) with width 96 and height 111.
; PLAN: r0=213(x), r1=9(y), r2=96(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 9
LDI r2, 96
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
