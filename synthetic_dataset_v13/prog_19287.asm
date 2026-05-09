; DESCRIPTION: Draws a magenta rectangle at (354, 117) with width 57 and height 46.
; PLAN: r0=354(x), r1=117(y), r2=57(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 117
LDI r2, 57
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
