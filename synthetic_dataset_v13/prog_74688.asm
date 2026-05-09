; DESCRIPTION: Draws a black rectangle at (239, 100) with width 80 and height 37.
; PLAN: r0=239(x), r1=100(y), r2=80(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 100
LDI r2, 80
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
