; DESCRIPTION: Draws a magenta rectangle at (32, 174) with width 115 and height 64.
; PLAN: r0=32(x), r1=174(y), r2=115(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 174
LDI r2, 115
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
