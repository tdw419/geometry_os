; DESCRIPTION: Draws a purple rectangle at (167, 135) with width 81 and height 42.
; PLAN: r0=167(x), r1=135(y), r2=81(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 135
LDI r2, 81
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
