; DESCRIPTION: Draws a black rectangle at (198, 90) with width 105 and height 51.
; PLAN: r0=198(x), r1=90(y), r2=105(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 90
LDI r2, 105
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
