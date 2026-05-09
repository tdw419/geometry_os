; DESCRIPTION: Draws a green rectangle at (128, 85) with width 64 and height 86.
; PLAN: r0=128(x), r1=85(y), r2=64(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 85
LDI r2, 64
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
