; DESCRIPTION: Draws a yellow rectangle at (282, 159) with width 47 and height 23.
; PLAN: r0=282(x), r1=159(y), r2=47(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 159
LDI r2, 47
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
