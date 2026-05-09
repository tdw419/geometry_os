; DESCRIPTION: Draws a magenta rectangle at (384, 137) with width 102 and height 61.
; PLAN: r0=384(x), r1=137(y), r2=102(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 137
LDI r2, 102
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
