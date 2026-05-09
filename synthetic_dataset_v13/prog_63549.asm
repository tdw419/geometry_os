; DESCRIPTION: Draws a magenta rectangle at (48, 144) with width 28 and height 79.
; PLAN: r0=48(x), r1=144(y), r2=28(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 144
LDI r2, 28
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
