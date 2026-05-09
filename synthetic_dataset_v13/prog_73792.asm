; DESCRIPTION: Draws a magenta rectangle at (221, 138) with width 18 and height 21.
; PLAN: r0=221(x), r1=138(y), r2=18(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 138
LDI r2, 18
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
