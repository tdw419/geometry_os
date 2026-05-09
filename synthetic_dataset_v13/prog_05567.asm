; DESCRIPTION: Draws a green rectangle at (82, 17) with width 112 and height 104.
; PLAN: r0=82(x), r1=17(y), r2=112(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 17
LDI r2, 112
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
