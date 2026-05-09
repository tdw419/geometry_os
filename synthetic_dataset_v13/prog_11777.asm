; DESCRIPTION: Draws a magenta rectangle at (60, 194) with width 48 and height 52.
; PLAN: r0=60(x), r1=194(y), r2=48(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 194
LDI r2, 48
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
