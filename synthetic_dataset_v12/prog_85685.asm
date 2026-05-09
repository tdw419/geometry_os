; DESCRIPTION: Draws a green rectangle at (225, 19) with width 76 and height 31.
; PLAN: r0=225(x), r1=19(y), r2=76(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 19
LDI r2, 76
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
