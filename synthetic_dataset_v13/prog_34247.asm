; DESCRIPTION: Draws a blue rectangle at (45, 20) with width 37 and height 42.
; PLAN: r0=45(x), r1=20(y), r2=37(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 20
LDI r2, 37
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
