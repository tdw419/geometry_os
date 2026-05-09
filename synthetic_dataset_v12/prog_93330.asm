; DESCRIPTION: Draws a green rectangle at (369, 3) with width 28 and height 112.
; PLAN: r0=369(x), r1=3(y), r2=28(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 3
LDI r2, 28
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
