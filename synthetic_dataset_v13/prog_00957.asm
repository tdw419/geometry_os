; DESCRIPTION: Draws a yellow rectangle at (12, 192) with width 49 and height 28.
; PLAN: r0=12(x), r1=192(y), r2=49(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 192
LDI r2, 49
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
