; DESCRIPTION: Draws a magenta rectangle at (124, 213) with width 38 and height 29.
; PLAN: r0=124(x), r1=213(y), r2=38(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 213
LDI r2, 38
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
