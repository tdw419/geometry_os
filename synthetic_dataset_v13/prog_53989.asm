; DESCRIPTION: Draws a magenta rectangle at (268, 149) with width 112 and height 23.
; PLAN: r0=268(x), r1=149(y), r2=112(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 149
LDI r2, 112
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
