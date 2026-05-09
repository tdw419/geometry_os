; DESCRIPTION: Draws a magenta rectangle at (320, 139) with width 103 and height 87.
; PLAN: r0=320(x), r1=139(y), r2=103(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 139
LDI r2, 103
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
