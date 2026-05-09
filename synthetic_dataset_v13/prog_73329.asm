; DESCRIPTION: Draws a magenta rectangle at (354, 70) with width 18 and height 31.
; PLAN: r0=354(x), r1=70(y), r2=18(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 70
LDI r2, 18
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
