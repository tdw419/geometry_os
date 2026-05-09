; DESCRIPTION: Draws a magenta rectangle at (177, 80) with width 61 and height 30.
; PLAN: r0=177(x), r1=80(y), r2=61(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 80
LDI r2, 61
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
