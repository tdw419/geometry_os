; DESCRIPTION: Draws a blue rectangle at (179, 13) with width 42 and height 31.
; PLAN: r0=179(x), r1=13(y), r2=42(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 13
LDI r2, 42
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
