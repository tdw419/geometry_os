; DESCRIPTION: Draws a black rectangle at (383, 125) with width 70 and height 20.
; PLAN: r0=383(x), r1=125(y), r2=70(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 125
LDI r2, 70
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
