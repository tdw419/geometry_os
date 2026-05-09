; DESCRIPTION: Draws a magenta rectangle at (379, 29) with width 21 and height 31.
; PLAN: r0=379(x), r1=29(y), r2=21(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 29
LDI r2, 21
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
