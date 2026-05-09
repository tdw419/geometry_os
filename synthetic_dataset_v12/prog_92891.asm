; DESCRIPTION: Draws a magenta rectangle at (208, 74) with width 57 and height 11.
; PLAN: r0=208(x), r1=74(y), r2=57(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 74
LDI r2, 57
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
