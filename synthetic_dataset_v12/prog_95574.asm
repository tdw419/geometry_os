; DESCRIPTION: Draws a magenta rectangle at (70, 24) with width 10 and height 39.
; PLAN: r0=70(x), r1=24(y), r2=10(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 24
LDI r2, 10
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
