; DESCRIPTION: Draws a yellow rectangle at (250, 188) with width 111 and height 20.
; PLAN: r0=250(x), r1=188(y), r2=111(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 188
LDI r2, 111
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
