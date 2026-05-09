; DESCRIPTION: Draws a magenta rectangle at (54, 217) with width 32 and height 24.
; PLAN: r0=54(x), r1=217(y), r2=32(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 217
LDI r2, 32
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
