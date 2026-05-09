; DESCRIPTION: Draws a black rectangle at (326, 104) with width 63 and height 86.
; PLAN: r0=326(x), r1=104(y), r2=63(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 104
LDI r2, 63
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
