; DESCRIPTION: Draws a magenta rectangle at (71, 37) with width 36 and height 120.
; PLAN: r0=71(x), r1=37(y), r2=36(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 37
LDI r2, 36
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
