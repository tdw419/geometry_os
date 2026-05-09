; DESCRIPTION: Draws a magenta rectangle at (128, 29) with width 14 and height 46.
; PLAN: r0=128(x), r1=29(y), r2=14(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 29
LDI r2, 14
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
