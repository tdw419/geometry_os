; DESCRIPTION: Draws a blue rectangle at (101, 111) with width 36 and height 56.
; PLAN: r0=101(x), r1=111(y), r2=36(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 111
LDI r2, 36
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
