; DESCRIPTION: Draws a magenta rectangle at (89, 129) with width 49 and height 87.
; PLAN: r0=89(x), r1=129(y), r2=49(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 129
LDI r2, 49
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
