; DESCRIPTION: Draws a blue rectangle at (139, 218) with width 38 and height 14.
; PLAN: r0=139(x), r1=218(y), r2=38(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 218
LDI r2, 38
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
