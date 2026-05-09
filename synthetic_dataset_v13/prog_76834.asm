; DESCRIPTION: Draws a purple rectangle at (269, 76) with width 78 and height 24.
; PLAN: r0=269(x), r1=76(y), r2=78(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 76
LDI r2, 78
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
