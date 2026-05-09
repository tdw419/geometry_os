; DESCRIPTION: Draws a blue rectangle at (13, 36) with width 81 and height 42.
; PLAN: r0=13(x), r1=36(y), r2=81(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 36
LDI r2, 81
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
