; DESCRIPTION: Draws a magenta rectangle at (278, 94) with width 117 and height 61.
; PLAN: r0=278(x), r1=94(y), r2=117(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 94
LDI r2, 117
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
