; DESCRIPTION: Draws a magenta rectangle at (315, 83) with width 31 and height 120.
; PLAN: r0=315(x), r1=83(y), r2=31(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 83
LDI r2, 31
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
