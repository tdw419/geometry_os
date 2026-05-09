; DESCRIPTION: Draws a purple rectangle at (265, 134) with width 86 and height 93.
; PLAN: r0=265(x), r1=134(y), r2=86(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 134
LDI r2, 86
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
