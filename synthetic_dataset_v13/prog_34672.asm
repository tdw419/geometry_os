; DESCRIPTION: Draws a blue rectangle at (201, 73) with width 103 and height 31.
; PLAN: r0=201(x), r1=73(y), r2=103(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 73
LDI r2, 103
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
