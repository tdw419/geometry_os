; DESCRIPTION: Draws a purple rectangle at (57, 176) with width 57 and height 71.
; PLAN: r0=57(x), r1=176(y), r2=57(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 176
LDI r2, 57
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
