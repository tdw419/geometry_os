; DESCRIPTION: Draws a yellow rectangle at (148, 13) with width 78 and height 86.
; PLAN: r0=148(x), r1=13(y), r2=78(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 13
LDI r2, 78
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
