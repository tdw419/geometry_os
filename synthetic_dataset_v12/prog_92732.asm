; DESCRIPTION: Draws a magenta rectangle at (205, 10) with width 23 and height 71.
; PLAN: r0=205(x), r1=10(y), r2=23(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 10
LDI r2, 23
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
