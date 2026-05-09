; DESCRIPTION: Draws a magenta rectangle at (251, 8) with width 47 and height 58.
; PLAN: r0=251(x), r1=8(y), r2=47(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 8
LDI r2, 47
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
