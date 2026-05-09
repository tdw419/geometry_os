; DESCRIPTION: Draws a yellow rectangle at (405, 56) with width 104 and height 40.
; PLAN: r0=405(x), r1=56(y), r2=104(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 56
LDI r2, 104
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
