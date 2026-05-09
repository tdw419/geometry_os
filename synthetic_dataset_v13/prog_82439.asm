; DESCRIPTION: Draws a yellow rectangle at (332, 119) with width 108 and height 16.
; PLAN: r0=332(x), r1=119(y), r2=108(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 119
LDI r2, 108
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
