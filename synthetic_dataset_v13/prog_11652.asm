; DESCRIPTION: Draws a magenta rectangle at (431, 154) with width 67 and height 76.
; PLAN: r0=431(x), r1=154(y), r2=67(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 154
LDI r2, 67
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
