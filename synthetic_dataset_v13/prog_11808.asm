; DESCRIPTION: Draws a purple rectangle at (160, 73) with width 77 and height 62.
; PLAN: r0=160(x), r1=73(y), r2=77(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 73
LDI r2, 77
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
