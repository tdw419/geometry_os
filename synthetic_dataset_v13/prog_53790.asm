; DESCRIPTION: Draws a black rectangle at (347, 70) with width 118 and height 82.
; PLAN: r0=347(x), r1=70(y), r2=118(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 70
LDI r2, 118
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
