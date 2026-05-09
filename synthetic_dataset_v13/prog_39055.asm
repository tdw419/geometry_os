; DESCRIPTION: Draws a yellow rectangle at (165, 112) with width 22 and height 111.
; PLAN: r0=165(x), r1=112(y), r2=22(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 112
LDI r2, 22
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
