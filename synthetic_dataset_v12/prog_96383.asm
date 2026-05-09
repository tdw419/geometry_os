; DESCRIPTION: Draws a magenta rectangle at (234, 128) with width 65 and height 65.
; PLAN: r0=234(x), r1=128(y), r2=65(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 128
LDI r2, 65
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
