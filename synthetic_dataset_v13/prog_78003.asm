; DESCRIPTION: Draws a magenta rectangle at (75, 128) with width 80 and height 72.
; PLAN: r0=75(x), r1=128(y), r2=80(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 128
LDI r2, 80
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
