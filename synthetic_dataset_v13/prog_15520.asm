; DESCRIPTION: Draws a white rectangle at (369, 84) with width 111 and height 25.
; PLAN: r0=369(x), r1=84(y), r2=111(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 84
LDI r2, 111
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
