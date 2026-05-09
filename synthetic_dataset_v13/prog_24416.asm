; DESCRIPTION: Draws a green rectangle at (299, 91) with width 39 and height 114.
; PLAN: r0=299(x), r1=91(y), r2=39(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 91
LDI r2, 39
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
