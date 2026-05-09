; DESCRIPTION: Draws a yellow rectangle at (364, 111) with width 15 and height 107.
; PLAN: r0=364(x), r1=111(y), r2=15(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 111
LDI r2, 15
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
