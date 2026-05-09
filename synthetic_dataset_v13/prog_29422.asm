; DESCRIPTION: Draws a magenta rectangle at (283, 31) with width 68 and height 48.
; PLAN: r0=283(x), r1=31(y), r2=68(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 31
LDI r2, 68
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
