; DESCRIPTION: Draws a yellow rectangle at (422, 79) with width 76 and height 21.
; PLAN: r0=422(x), r1=79(y), r2=76(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 79
LDI r2, 76
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
