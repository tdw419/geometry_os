; DESCRIPTION: Draws a magenta rectangle at (87, 133) with width 77 and height 100.
; PLAN: r0=87(x), r1=133(y), r2=77(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 133
LDI r2, 77
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
