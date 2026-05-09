; DESCRIPTION: Draws a blue rectangle at (375, 183) with width 60 and height 42.
; PLAN: r0=375(x), r1=183(y), r2=60(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 183
LDI r2, 60
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
