; DESCRIPTION: Draws a purple rectangle at (228, 71) with width 40 and height 107.
; PLAN: r0=228(x), r1=71(y), r2=40(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 71
LDI r2, 40
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
