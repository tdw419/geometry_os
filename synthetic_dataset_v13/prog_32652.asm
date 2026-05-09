; DESCRIPTION: Draws a black rectangle at (280, 115) with width 25 and height 105.
; PLAN: r0=280(x), r1=115(y), r2=25(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 115
LDI r2, 25
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
