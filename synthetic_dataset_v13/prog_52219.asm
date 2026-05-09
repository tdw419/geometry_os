; DESCRIPTION: Draws a green rectangle at (66, 43) with width 86 and height 59.
; PLAN: r0=66(x), r1=43(y), r2=86(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 43
LDI r2, 86
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
