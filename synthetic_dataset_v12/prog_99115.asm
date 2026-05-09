; DESCRIPTION: Draws a blue rectangle at (94, 205) with width 62 and height 33.
; PLAN: r0=94(x), r1=205(y), r2=62(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 205
LDI r2, 62
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
