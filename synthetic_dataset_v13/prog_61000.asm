; DESCRIPTION: Draws a magenta rectangle at (417, 34) with width 75 and height 40.
; PLAN: r0=417(x), r1=34(y), r2=75(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 34
LDI r2, 75
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
