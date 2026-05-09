; DESCRIPTION: Draws a purple rectangle at (384, 38) with width 94 and height 36.
; PLAN: r0=384(x), r1=38(y), r2=94(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 38
LDI r2, 94
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
