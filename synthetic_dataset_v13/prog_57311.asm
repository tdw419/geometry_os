; DESCRIPTION: Draws a purple rectangle at (408, 42) with width 14 and height 81.
; PLAN: r0=408(x), r1=42(y), r2=14(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 42
LDI r2, 14
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
