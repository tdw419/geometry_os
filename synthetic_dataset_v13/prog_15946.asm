; DESCRIPTION: Draws a blue rectangle at (403, 111) with width 101 and height 81.
; PLAN: r0=403(x), r1=111(y), r2=101(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 111
LDI r2, 101
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
