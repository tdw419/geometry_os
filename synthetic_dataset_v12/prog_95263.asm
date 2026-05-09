; DESCRIPTION: Draws a green rectangle at (17, 76) with width 59 and height 91.
; PLAN: r0=17(x), r1=76(y), r2=59(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 76
LDI r2, 59
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
