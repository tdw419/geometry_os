; DESCRIPTION: Draws a green rectangle at (422, 137) with width 76 and height 28.
; PLAN: r0=422(x), r1=137(y), r2=76(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 137
LDI r2, 76
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
