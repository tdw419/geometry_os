; DESCRIPTION: Draws a blue rectangle at (294, 36) with width 78 and height 116.
; PLAN: r0=294(x), r1=36(y), r2=78(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 36
LDI r2, 78
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
