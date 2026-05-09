; DESCRIPTION: Draws a blue rectangle at (3, 94) with width 57 and height 31.
; PLAN: r0=3(x), r1=94(y), r2=57(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 94
LDI r2, 57
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
