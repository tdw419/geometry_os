; DESCRIPTION: Draws a blue rectangle at (36, 10) with width 106 and height 42.
; PLAN: r0=36(x), r1=10(y), r2=106(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 10
LDI r2, 106
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
