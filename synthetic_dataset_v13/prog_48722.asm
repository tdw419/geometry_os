; DESCRIPTION: Draws a magenta rectangle at (331, 82) with width 81 and height 66.
; PLAN: r0=331(x), r1=82(y), r2=81(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 82
LDI r2, 81
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
