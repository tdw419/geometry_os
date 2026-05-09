; DESCRIPTION: Draws a yellow rectangle at (181, 4) with width 40 and height 86.
; PLAN: r0=181(x), r1=4(y), r2=40(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 4
LDI r2, 40
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
