; DESCRIPTION: Draws a blue rectangle at (29, 78) with width 42 and height 73.
; PLAN: r0=29(x), r1=78(y), r2=42(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 78
LDI r2, 42
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
