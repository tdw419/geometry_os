; DESCRIPTION: Draws a blue rectangle at (74, 232) with width 27 and height 16.
; PLAN: r0=74(x), r1=232(y), r2=27(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 232
LDI r2, 27
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
