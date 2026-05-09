; DESCRIPTION: Draws a white rectangle at (84, 192) with width 13 and height 50.
; PLAN: r0=84(x), r1=192(y), r2=13(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 192
LDI r2, 13
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
