; DESCRIPTION: Draws a blue rectangle at (134, 179) with width 111 and height 42.
; PLAN: r0=134(x), r1=179(y), r2=111(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 179
LDI r2, 111
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
