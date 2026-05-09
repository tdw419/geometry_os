; DESCRIPTION: Draws a yellow rectangle at (133, 157) with width 111 and height 99.
; PLAN: r0=133(x), r1=157(y), r2=111(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 157
LDI r2, 111
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
