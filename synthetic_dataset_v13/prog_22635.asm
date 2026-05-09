; DESCRIPTION: Draws a blue rectangle at (192, 18) with width 16 and height 31.
; PLAN: r0=192(x), r1=18(y), r2=16(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 18
LDI r2, 16
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
