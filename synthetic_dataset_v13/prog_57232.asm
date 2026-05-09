; DESCRIPTION: Draws a green rectangle at (441, 0) with width 59 and height 114.
; PLAN: r0=441(x), r1=0(y), r2=59(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 0
LDI r2, 59
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
