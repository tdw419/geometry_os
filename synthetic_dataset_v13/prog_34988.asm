; DESCRIPTION: Draws a yellow rectangle at (264, 49) with width 76 and height 55.
; PLAN: r0=264(x), r1=49(y), r2=76(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 49
LDI r2, 76
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
