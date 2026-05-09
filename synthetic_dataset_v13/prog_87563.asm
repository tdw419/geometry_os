; DESCRIPTION: Draws a black rectangle at (40, 34) with width 36 and height 111.
; PLAN: r0=40(x), r1=34(y), r2=36(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 34
LDI r2, 36
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
