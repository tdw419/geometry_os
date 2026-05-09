; DESCRIPTION: Draws a blue rectangle at (21, 111) with width 74 and height 96.
; PLAN: r0=21(x), r1=111(y), r2=74(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 111
LDI r2, 74
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
