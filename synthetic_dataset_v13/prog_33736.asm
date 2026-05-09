; DESCRIPTION: Draws a magenta rectangle at (123, 36) with width 77 and height 76.
; PLAN: r0=123(x), r1=36(y), r2=77(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 36
LDI r2, 77
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
