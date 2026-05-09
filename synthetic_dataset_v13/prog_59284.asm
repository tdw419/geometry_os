; DESCRIPTION: Draws a yellow rectangle at (331, 57) with width 119 and height 112.
; PLAN: r0=331(x), r1=57(y), r2=119(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 57
LDI r2, 119
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
