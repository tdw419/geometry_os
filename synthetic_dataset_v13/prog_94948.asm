; DESCRIPTION: Draws a black rectangle at (166, 125) with width 18 and height 70.
; PLAN: r0=166(x), r1=125(y), r2=18(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 125
LDI r2, 18
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
