; DESCRIPTION: Draws a yellow rectangle at (421, 104) with width 56 and height 120.
; PLAN: r0=421(x), r1=104(y), r2=56(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 104
LDI r2, 56
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
