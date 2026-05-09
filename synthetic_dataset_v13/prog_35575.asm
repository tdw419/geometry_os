; DESCRIPTION: Draws a purple rectangle at (94, 92) with width 42 and height 64.
; PLAN: r0=94(x), r1=92(y), r2=42(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 92
LDI r2, 42
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
