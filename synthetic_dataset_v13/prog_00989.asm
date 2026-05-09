; DESCRIPTION: Draws a magenta rectangle at (204, 219) with width 59 and height 14.
; PLAN: r0=204(x), r1=219(y), r2=59(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 219
LDI r2, 59
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
