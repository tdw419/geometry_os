; DESCRIPTION: Draws a green rectangle at (30, 35) with width 19 and height 82.
; PLAN: r0=30(x), r1=35(y), r2=19(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 35
LDI r2, 19
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
