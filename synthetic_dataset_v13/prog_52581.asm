; DESCRIPTION: Draws a purple rectangle at (361, 71) with width 113 and height 39.
; PLAN: r0=361(x), r1=71(y), r2=113(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 71
LDI r2, 113
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
