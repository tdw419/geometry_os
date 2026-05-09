; DESCRIPTION: Draws a black rectangle at (326, 63) with width 10 and height 17.
; PLAN: r0=326(x), r1=63(y), r2=10(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 63
LDI r2, 10
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
