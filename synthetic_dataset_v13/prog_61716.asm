; DESCRIPTION: Draws a yellow rectangle at (384, 174) with width 25 and height 25.
; PLAN: r0=384(x), r1=174(y), r2=25(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 174
LDI r2, 25
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
