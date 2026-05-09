; DESCRIPTION: Draws a black rectangle at (98, 84) with width 71 and height 50.
; PLAN: r0=98(x), r1=84(y), r2=71(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 84
LDI r2, 71
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
