; DESCRIPTION: Draws a magenta rectangle at (204, 186) with width 52 and height 25.
; PLAN: r0=204(x), r1=186(y), r2=52(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 186
LDI r2, 52
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
