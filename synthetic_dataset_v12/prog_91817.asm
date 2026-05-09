; DESCRIPTION: Draws a yellow rectangle at (191, 46) with width 73 and height 103.
; PLAN: r0=191(x), r1=46(y), r2=73(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 46
LDI r2, 73
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
