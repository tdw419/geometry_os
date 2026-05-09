; DESCRIPTION: Draws a magenta rectangle at (34, 205) with width 60 and height 31.
; PLAN: r0=34(x), r1=205(y), r2=60(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 205
LDI r2, 60
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
