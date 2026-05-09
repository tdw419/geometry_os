; DESCRIPTION: Draws a purple rectangle at (111, 62) with width 21 and height 92.
; PLAN: r0=111(x), r1=62(y), r2=21(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 62
LDI r2, 21
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
