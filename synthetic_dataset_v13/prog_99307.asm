; DESCRIPTION: Draws a magenta rectangle at (21, 50) with width 84 and height 93.
; PLAN: r0=21(x), r1=50(y), r2=84(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 50
LDI r2, 84
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
