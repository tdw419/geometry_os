; DESCRIPTION: Draws a magenta rectangle at (289, 6) with width 103 and height 55.
; PLAN: r0=289(x), r1=6(y), r2=103(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 6
LDI r2, 103
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
