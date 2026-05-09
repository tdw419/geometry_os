; DESCRIPTION: Draws a magenta rectangle at (297, 11) with width 45 and height 89.
; PLAN: r0=297(x), r1=11(y), r2=45(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 11
LDI r2, 45
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
