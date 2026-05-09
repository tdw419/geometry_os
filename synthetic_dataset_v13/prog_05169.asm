; DESCRIPTION: Draws a magenta rectangle at (354, 29) with width 83 and height 80.
; PLAN: r0=354(x), r1=29(y), r2=83(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 29
LDI r2, 83
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
