; DESCRIPTION: Draws a black rectangle at (448, 142) with width 46 and height 107.
; PLAN: r0=448(x), r1=142(y), r2=46(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 142
LDI r2, 46
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
