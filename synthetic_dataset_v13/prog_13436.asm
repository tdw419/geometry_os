; DESCRIPTION: Draws a magenta rectangle at (72, 124) with width 74 and height 14.
; PLAN: r0=72(x), r1=124(y), r2=74(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 124
LDI r2, 74
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
