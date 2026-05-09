; DESCRIPTION: Draws a white rectangle at (366, 66) with width 38 and height 107.
; PLAN: r0=366(x), r1=66(y), r2=38(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 66
LDI r2, 38
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
