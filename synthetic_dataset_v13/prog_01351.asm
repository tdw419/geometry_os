; DESCRIPTION: Draws a magenta rectangle at (276, 23) with width 86 and height 102.
; PLAN: r0=276(x), r1=23(y), r2=86(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 23
LDI r2, 86
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
