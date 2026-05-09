; DESCRIPTION: Draws a magenta rectangle at (21, 185) with width 16 and height 25.
; PLAN: r0=21(x), r1=185(y), r2=16(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 185
LDI r2, 16
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
