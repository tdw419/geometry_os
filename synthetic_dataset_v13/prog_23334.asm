; DESCRIPTION: Draws a green rectangle at (422, 33) with width 34 and height 69.
; PLAN: r0=422(x), r1=33(y), r2=34(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 33
LDI r2, 34
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
