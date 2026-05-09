; DESCRIPTION: Draws a green rectangle at (130, 18) with width 39 and height 98.
; PLAN: r0=130(x), r1=18(y), r2=39(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 18
LDI r2, 39
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
