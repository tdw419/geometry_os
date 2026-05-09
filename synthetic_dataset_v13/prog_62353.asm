; DESCRIPTION: Draws a magenta rectangle at (126, 194) with width 24 and height 14.
; PLAN: r0=126(x), r1=194(y), r2=24(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 194
LDI r2, 24
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
