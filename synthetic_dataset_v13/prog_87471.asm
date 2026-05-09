; DESCRIPTION: Draws a white rectangle at (448, 47) with width 46 and height 15.
; PLAN: r0=448(x), r1=47(y), r2=46(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 47
LDI r2, 46
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
