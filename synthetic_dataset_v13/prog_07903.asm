; DESCRIPTION: Draws a magenta rectangle at (486, 5) with width 20 and height 24.
; PLAN: r0=486(x), r1=5(y), r2=20(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 5
LDI r2, 20
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
