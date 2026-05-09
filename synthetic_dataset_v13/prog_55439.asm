; DESCRIPTION: Draws a black rectangle at (46, 101) with width 10 and height 63.
; PLAN: r0=46(x), r1=101(y), r2=10(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 101
LDI r2, 10
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
