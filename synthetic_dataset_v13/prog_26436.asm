; DESCRIPTION: Draws a magenta rectangle at (376, 124) with width 95 and height 70.
; PLAN: r0=376(x), r1=124(y), r2=95(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 124
LDI r2, 95
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
