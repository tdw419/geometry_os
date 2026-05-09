; DESCRIPTION: Draws a purple rectangle at (340, 195) with width 86 and height 22.
; PLAN: r0=340(x), r1=195(y), r2=86(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 195
LDI r2, 86
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
