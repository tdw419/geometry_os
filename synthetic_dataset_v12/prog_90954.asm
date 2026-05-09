; DESCRIPTION: Draws a yellow rectangle at (422, 12) with width 40 and height 92.
; PLAN: r0=422(x), r1=12(y), r2=40(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 12
LDI r2, 40
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
