; DESCRIPTION: Draws a blue rectangle at (365, 42) with width 69 and height 115.
; PLAN: r0=365(x), r1=42(y), r2=69(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 42
LDI r2, 69
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
