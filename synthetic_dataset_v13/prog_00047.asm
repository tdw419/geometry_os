; DESCRIPTION: Draws a magenta rectangle at (73, 6) with width 64 and height 71.
; PLAN: r0=73(x), r1=6(y), r2=64(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 6
LDI r2, 64
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
