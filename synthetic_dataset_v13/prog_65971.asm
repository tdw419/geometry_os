; DESCRIPTION: Draws a yellow rectangle at (409, 50) with width 19 and height 33.
; PLAN: r0=409(x), r1=50(y), r2=19(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 50
LDI r2, 19
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
