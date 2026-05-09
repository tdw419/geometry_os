; DESCRIPTION: Draws a yellow rectangle at (422, 58) with width 20 and height 107.
; PLAN: r0=422(x), r1=58(y), r2=20(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 58
LDI r2, 20
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
