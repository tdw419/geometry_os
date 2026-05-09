; DESCRIPTION: Draws a green rectangle at (275, 141) with width 35 and height 33.
; PLAN: r0=275(x), r1=141(y), r2=35(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 141
LDI r2, 35
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
