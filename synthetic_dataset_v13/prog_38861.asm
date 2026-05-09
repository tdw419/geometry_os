; DESCRIPTION: Draws a magenta rectangle at (201, 13) with width 45 and height 80.
; PLAN: r0=201(x), r1=13(y), r2=45(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 13
LDI r2, 45
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
