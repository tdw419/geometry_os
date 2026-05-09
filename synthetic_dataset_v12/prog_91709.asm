; DESCRIPTION: Draws a green rectangle at (227, 165) with width 108 and height 27.
; PLAN: r0=227(x), r1=165(y), r2=108(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 165
LDI r2, 108
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
