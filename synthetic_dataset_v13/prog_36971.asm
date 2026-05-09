; DESCRIPTION: Draws a magenta rectangle at (300, 124) with width 81 and height 112.
; PLAN: r0=300(x), r1=124(y), r2=81(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 124
LDI r2, 81
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
