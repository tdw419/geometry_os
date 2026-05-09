; DESCRIPTION: Draws a yellow rectangle at (36, 22) with width 76 and height 33.
; PLAN: r0=36(x), r1=22(y), r2=76(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 22
LDI r2, 76
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
