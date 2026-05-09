; DESCRIPTION: Draws a blue rectangle at (334, 16) with width 64 and height 42.
; PLAN: r0=334(x), r1=16(y), r2=64(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 16
LDI r2, 64
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
