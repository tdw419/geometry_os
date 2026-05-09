; DESCRIPTION: Draws a black rectangle at (375, 84) with width 54 and height 82.
; PLAN: r0=375(x), r1=84(y), r2=54(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 84
LDI r2, 54
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
