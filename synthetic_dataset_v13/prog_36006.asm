; DESCRIPTION: Draws a black rectangle at (198, 110) with width 21 and height 23.
; PLAN: r0=198(x), r1=110(y), r2=21(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 110
LDI r2, 21
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
