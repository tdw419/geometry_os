; DESCRIPTION: Draws a purple rectangle at (107, 130) with width 99 and height 109.
; PLAN: r0=107(x), r1=130(y), r2=99(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 130
LDI r2, 99
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
