; DESCRIPTION: Draws a magenta rectangle at (461, 153) with width 11 and height 71.
; PLAN: r0=461(x), r1=153(y), r2=11(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 153
LDI r2, 11
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
