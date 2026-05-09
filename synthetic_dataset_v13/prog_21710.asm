; DESCRIPTION: Draws a green rectangle at (17, 111) with width 102 and height 86.
; PLAN: r0=17(x), r1=111(y), r2=102(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 111
LDI r2, 102
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
