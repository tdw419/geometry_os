; DESCRIPTION: Draws a green rectangle at (201, 61) with width 82 and height 63.
; PLAN: r0=201(x), r1=61(y), r2=82(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 61
LDI r2, 82
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
