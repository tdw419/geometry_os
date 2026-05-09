; DESCRIPTION: Draws a magenta rectangle at (434, 63) with width 32 and height 45.
; PLAN: r0=434(x), r1=63(y), r2=32(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 63
LDI r2, 32
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
