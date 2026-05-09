; DESCRIPTION: Draws a magenta rectangle at (256, 56) with width 10 and height 42.
; PLAN: r0=256(x), r1=56(y), r2=10(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 56
LDI r2, 10
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
