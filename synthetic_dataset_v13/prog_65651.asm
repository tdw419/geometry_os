; DESCRIPTION: Draws a purple rectangle at (227, 93) with width 60 and height 109.
; PLAN: r0=227(x), r1=93(y), r2=60(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 93
LDI r2, 60
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
