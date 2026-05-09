; DESCRIPTION: Draws a magenta rectangle at (341, 94) with width 45 and height 25.
; PLAN: r0=341(x), r1=94(y), r2=45(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 94
LDI r2, 45
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
