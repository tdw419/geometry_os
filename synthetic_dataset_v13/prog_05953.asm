; DESCRIPTION: Draws a black rectangle at (102, 86) with width 63 and height 84.
; PLAN: r0=102(x), r1=86(y), r2=63(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 86
LDI r2, 63
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
