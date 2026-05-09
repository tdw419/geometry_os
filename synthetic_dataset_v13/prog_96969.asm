; DESCRIPTION: Draws a purple rectangle at (82, 83) with width 29 and height 23.
; PLAN: r0=82(x), r1=83(y), r2=29(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 83
LDI r2, 29
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
