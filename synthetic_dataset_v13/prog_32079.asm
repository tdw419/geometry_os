; DESCRIPTION: Draws a purple rectangle at (203, 93) with width 109 and height 52.
; PLAN: r0=203(x), r1=93(y), r2=109(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 93
LDI r2, 109
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
