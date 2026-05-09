; DESCRIPTION: Draws a blue rectangle at (206, 139) with width 64 and height 31.
; PLAN: r0=206(x), r1=139(y), r2=64(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 139
LDI r2, 64
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
