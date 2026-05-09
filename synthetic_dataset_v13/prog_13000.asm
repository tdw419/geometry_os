; DESCRIPTION: Draws a black rectangle at (226, 2) with width 22 and height 111.
; PLAN: r0=226(x), r1=2(y), r2=22(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 2
LDI r2, 22
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
