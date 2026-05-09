; DESCRIPTION: Draws a yellow rectangle at (449, 104) with width 44 and height 76.
; PLAN: r0=449(x), r1=104(y), r2=44(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 104
LDI r2, 44
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
