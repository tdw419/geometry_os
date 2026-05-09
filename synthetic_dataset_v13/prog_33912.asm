; DESCRIPTION: Draws a blue rectangle at (20, 101) with width 61 and height 72.
; PLAN: r0=20(x), r1=101(y), r2=61(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 101
LDI r2, 61
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
