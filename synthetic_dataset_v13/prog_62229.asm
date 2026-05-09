; DESCRIPTION: Draws a yellow rectangle at (452, 167) with width 58 and height 37.
; PLAN: r0=452(x), r1=167(y), r2=58(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 167
LDI r2, 58
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
