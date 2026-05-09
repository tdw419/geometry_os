; DESCRIPTION: Draws a blue rectangle at (131, 19) with width 72 and height 40.
; PLAN: r0=131(x), r1=19(y), r2=72(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 19
LDI r2, 72
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
