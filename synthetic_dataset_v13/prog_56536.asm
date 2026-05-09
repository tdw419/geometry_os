; DESCRIPTION: Draws a black rectangle at (345, 38) with width 111 and height 114.
; PLAN: r0=345(x), r1=38(y), r2=111(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 38
LDI r2, 111
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
