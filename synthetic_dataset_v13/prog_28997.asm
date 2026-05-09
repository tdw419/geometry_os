; DESCRIPTION: Draws a magenta rectangle at (227, 223) with width 74 and height 22.
; PLAN: r0=227(x), r1=223(y), r2=74(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 223
LDI r2, 74
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
