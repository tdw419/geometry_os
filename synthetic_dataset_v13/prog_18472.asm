; DESCRIPTION: Draws a purple rectangle at (233, 21) with width 108 and height 59.
; PLAN: r0=233(x), r1=21(y), r2=108(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 21
LDI r2, 108
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
