; DESCRIPTION: Draws a yellow rectangle at (188, 134) with width 46 and height 111.
; PLAN: r0=188(x), r1=134(y), r2=46(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 134
LDI r2, 46
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
