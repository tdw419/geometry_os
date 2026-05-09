; DESCRIPTION: Draws a blue rectangle at (263, 201) with width 13 and height 54.
; PLAN: r0=263(x), r1=201(y), r2=13(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 201
LDI r2, 13
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
