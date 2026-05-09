; DESCRIPTION: Draws a magenta rectangle at (276, 107) with width 85 and height 80.
; PLAN: r0=276(x), r1=107(y), r2=85(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 107
LDI r2, 85
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
