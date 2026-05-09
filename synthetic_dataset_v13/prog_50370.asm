; DESCRIPTION: Draws a purple rectangle at (446, 37) with width 28 and height 64.
; PLAN: r0=446(x), r1=37(y), r2=28(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 37
LDI r2, 28
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
