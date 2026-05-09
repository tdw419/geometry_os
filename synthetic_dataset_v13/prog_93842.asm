; DESCRIPTION: Draws a purple rectangle at (250, 177) with width 47 and height 62.
; PLAN: r0=250(x), r1=177(y), r2=47(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 177
LDI r2, 47
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
