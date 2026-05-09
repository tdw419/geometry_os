; DESCRIPTION: Draws a purple rectangle at (315, 111) with width 28 and height 46.
; PLAN: r0=315(x), r1=111(y), r2=28(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 111
LDI r2, 28
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
