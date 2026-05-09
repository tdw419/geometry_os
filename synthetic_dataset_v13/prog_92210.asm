; DESCRIPTION: Draws a yellow rectangle at (380, 123) with width 63 and height 43.
; PLAN: r0=380(x), r1=123(y), r2=63(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 123
LDI r2, 63
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
