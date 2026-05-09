; DESCRIPTION: Draws a yellow rectangle at (459, 52) with width 11 and height 111.
; PLAN: r0=459(x), r1=52(y), r2=11(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 52
LDI r2, 11
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
