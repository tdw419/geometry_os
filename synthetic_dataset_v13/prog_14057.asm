; DESCRIPTION: Draws a magenta rectangle at (21, 157) with width 31 and height 52.
; PLAN: r0=21(x), r1=157(y), r2=31(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 157
LDI r2, 31
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
