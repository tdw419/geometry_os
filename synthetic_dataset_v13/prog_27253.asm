; DESCRIPTION: Draws a green rectangle at (201, 14) with width 50 and height 86.
; PLAN: r0=201(x), r1=14(y), r2=50(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 14
LDI r2, 50
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
