; DESCRIPTION: Draws a black rectangle at (261, 8) with width 37 and height 65.
; PLAN: r0=261(x), r1=8(y), r2=37(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 8
LDI r2, 37
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
