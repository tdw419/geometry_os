; DESCRIPTION: Draws a magenta rectangle at (328, 38) with width 12 and height 99.
; PLAN: r0=328(x), r1=38(y), r2=12(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 38
LDI r2, 12
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
