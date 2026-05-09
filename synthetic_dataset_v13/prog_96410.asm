; DESCRIPTION: Draws a magenta rectangle at (332, 149) with width 53 and height 46.
; PLAN: r0=332(x), r1=149(y), r2=53(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 149
LDI r2, 53
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
