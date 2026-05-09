; DESCRIPTION: Draws a yellow rectangle at (455, 31) with width 56 and height 98.
; PLAN: r0=455(x), r1=31(y), r2=56(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 31
LDI r2, 56
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
