; DESCRIPTION: Draws a blue rectangle at (20, 42) with width 74 and height 39.
; PLAN: r0=20(x), r1=42(y), r2=74(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 42
LDI r2, 74
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
