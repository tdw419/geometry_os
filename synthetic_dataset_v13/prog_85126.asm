; DESCRIPTION: Draws a magenta rectangle at (473, 73) with width 32 and height 31.
; PLAN: r0=473(x), r1=73(y), r2=32(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 73
LDI r2, 32
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
