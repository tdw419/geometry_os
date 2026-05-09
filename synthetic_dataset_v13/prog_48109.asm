; DESCRIPTION: Draws a yellow rectangle at (221, 11) with width 49 and height 40.
; PLAN: r0=221(x), r1=11(y), r2=49(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 11
LDI r2, 49
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
