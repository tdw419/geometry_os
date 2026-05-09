; DESCRIPTION: Draws a blue rectangle at (81, 103) with width 36 and height 111.
; PLAN: r0=81(x), r1=103(y), r2=36(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 103
LDI r2, 36
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
