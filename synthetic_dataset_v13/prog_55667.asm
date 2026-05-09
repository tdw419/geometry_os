; DESCRIPTION: Draws a magenta rectangle at (326, 234) with width 33 and height 21.
; PLAN: r0=326(x), r1=234(y), r2=33(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 234
LDI r2, 33
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
