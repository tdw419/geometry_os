; DESCRIPTION: Draws a yellow rectangle at (379, 19) with width 63 and height 60.
; PLAN: r0=379(x), r1=19(y), r2=63(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 19
LDI r2, 63
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
