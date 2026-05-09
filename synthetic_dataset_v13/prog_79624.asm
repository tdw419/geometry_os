; DESCRIPTION: Draws a magenta rectangle at (286, 102) with width 95 and height 103.
; PLAN: r0=286(x), r1=102(y), r2=95(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 102
LDI r2, 95
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
