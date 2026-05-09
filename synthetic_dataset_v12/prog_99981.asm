; DESCRIPTION: Draws a magenta rectangle at (354, 71) with width 17 and height 92.
; PLAN: r0=354(x), r1=71(y), r2=17(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 71
LDI r2, 17
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
