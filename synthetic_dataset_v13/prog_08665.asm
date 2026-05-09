; DESCRIPTION: Draws a yellow rectangle at (49, 167) with width 12 and height 47.
; PLAN: r0=49(x), r1=167(y), r2=12(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 167
LDI r2, 12
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
