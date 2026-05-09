; DESCRIPTION: Draws a magenta rectangle at (12, 64) with width 77 and height 91.
; PLAN: r0=12(x), r1=64(y), r2=77(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 64
LDI r2, 77
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
