; DESCRIPTION: Draws a blue rectangle at (377, 42) with width 117 and height 105.
; PLAN: r0=377(x), r1=42(y), r2=117(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 42
LDI r2, 117
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
