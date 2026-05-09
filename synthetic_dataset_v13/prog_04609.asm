; DESCRIPTION: Draws a yellow rectangle at (441, 189) with width 69 and height 14.
; PLAN: r0=441(x), r1=189(y), r2=69(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 189
LDI r2, 69
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
