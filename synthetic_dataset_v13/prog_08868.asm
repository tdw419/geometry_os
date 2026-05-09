; DESCRIPTION: Draws a black rectangle at (225, 165) with width 13 and height 18.
; PLAN: r0=225(x), r1=165(y), r2=13(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 165
LDI r2, 13
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
