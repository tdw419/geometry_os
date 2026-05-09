; DESCRIPTION: Draws a magenta rectangle at (439, 136) with width 71 and height 72.
; PLAN: r0=439(x), r1=136(y), r2=71(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 136
LDI r2, 71
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
