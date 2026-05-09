; DESCRIPTION: Draws a yellow rectangle at (422, 84) with width 31 and height 104.
; PLAN: r0=422(x), r1=84(y), r2=31(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 84
LDI r2, 31
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
