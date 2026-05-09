; DESCRIPTION: Draws a magenta rectangle at (122, 126) with width 87 and height 16.
; PLAN: r0=122(x), r1=126(y), r2=87(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 126
LDI r2, 87
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
