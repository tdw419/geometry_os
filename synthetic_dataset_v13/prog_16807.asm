; DESCRIPTION: Draws a magenta rectangle at (34, 23) with width 52 and height 16.
; PLAN: r0=34(x), r1=23(y), r2=52(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 23
LDI r2, 52
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
