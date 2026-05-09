; DESCRIPTION: Draws a magenta rectangle at (138, 225) with width 39 and height 11.
; PLAN: r0=138(x), r1=225(y), r2=39(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 225
LDI r2, 39
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
