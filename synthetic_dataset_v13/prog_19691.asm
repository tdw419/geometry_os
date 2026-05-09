; DESCRIPTION: Draws a purple rectangle at (137, 93) with width 16 and height 71.
; PLAN: r0=137(x), r1=93(y), r2=16(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 93
LDI r2, 16
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
