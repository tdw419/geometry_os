; DESCRIPTION: Draws a purple rectangle at (34, 55) with width 99 and height 59.
; PLAN: r0=34(x), r1=55(y), r2=99(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 55
LDI r2, 99
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
