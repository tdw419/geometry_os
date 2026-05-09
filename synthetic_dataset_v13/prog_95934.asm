; DESCRIPTION: Draws a magenta rectangle at (269, 57) with width 37 and height 108.
; PLAN: r0=269(x), r1=57(y), r2=37(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 57
LDI r2, 37
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
