; DESCRIPTION: Draws a magenta rectangle at (248, 192) with width 60 and height 27.
; PLAN: r0=248(x), r1=192(y), r2=60(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 192
LDI r2, 60
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
