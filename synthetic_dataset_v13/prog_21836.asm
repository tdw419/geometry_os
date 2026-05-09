; DESCRIPTION: Draws a magenta rectangle at (77, 81) with width 59 and height 46.
; PLAN: r0=77(x), r1=81(y), r2=59(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 81
LDI r2, 59
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
