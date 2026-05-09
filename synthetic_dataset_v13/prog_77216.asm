; DESCRIPTION: Draws a purple rectangle at (430, 109) with width 28 and height 63.
; PLAN: r0=430(x), r1=109(y), r2=28(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 109
LDI r2, 28
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
