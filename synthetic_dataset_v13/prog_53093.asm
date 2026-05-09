; DESCRIPTION: Draws a yellow rectangle at (34, 119) with width 25 and height 111.
; PLAN: r0=34(x), r1=119(y), r2=25(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 119
LDI r2, 25
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
