; DESCRIPTION: Draws a magenta rectangle at (435, 159) with width 59 and height 36.
; PLAN: r0=435(x), r1=159(y), r2=59(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 159
LDI r2, 59
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
