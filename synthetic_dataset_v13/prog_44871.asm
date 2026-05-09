; DESCRIPTION: Draws a yellow rectangle at (422, 78) with width 64 and height 67.
; PLAN: r0=422(x), r1=78(y), r2=64(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 78
LDI r2, 64
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
