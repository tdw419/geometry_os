; DESCRIPTION: Draws a black rectangle at (364, 54) with width 38 and height 91.
; PLAN: r0=364(x), r1=54(y), r2=38(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 54
LDI r2, 38
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
