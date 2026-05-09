; DESCRIPTION: Draws a magenta rectangle at (353, 124) with width 57 and height 66.
; PLAN: r0=353(x), r1=124(y), r2=57(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 124
LDI r2, 57
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
