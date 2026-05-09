; DESCRIPTION: Draws a black rectangle at (198, 77) with width 99 and height 106.
; PLAN: r0=198(x), r1=77(y), r2=99(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 77
LDI r2, 99
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
