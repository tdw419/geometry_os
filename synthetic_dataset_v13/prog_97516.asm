; DESCRIPTION: Draws a yellow rectangle at (71, 66) with width 111 and height 13.
; PLAN: r0=71(x), r1=66(y), r2=111(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 66
LDI r2, 111
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
