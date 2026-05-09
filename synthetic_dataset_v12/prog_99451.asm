; DESCRIPTION: Draws a magenta rectangle at (245, 188) with width 60 and height 32.
; PLAN: r0=245(x), r1=188(y), r2=60(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 188
LDI r2, 60
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
