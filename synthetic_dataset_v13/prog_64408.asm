; DESCRIPTION: Draws a black rectangle at (313, 20) with width 75 and height 13.
; PLAN: r0=313(x), r1=20(y), r2=75(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 20
LDI r2, 75
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
