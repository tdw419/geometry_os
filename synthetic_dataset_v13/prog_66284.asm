; DESCRIPTION: Draws a purple rectangle at (101, 59) with width 23 and height 62.
; PLAN: r0=101(x), r1=59(y), r2=23(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 59
LDI r2, 23
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
