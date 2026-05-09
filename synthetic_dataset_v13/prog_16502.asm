; DESCRIPTION: Draws a black rectangle at (117, 60) with width 22 and height 105.
; PLAN: r0=117(x), r1=60(y), r2=22(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 60
LDI r2, 22
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
