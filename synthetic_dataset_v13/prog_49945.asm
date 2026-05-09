; DESCRIPTION: Draws a red rectangle at (201, 132) with width 111 and height 49.
; PLAN: r0=201(x), r1=132(y), r2=111(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 132
LDI r2, 111
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
