; DESCRIPTION: Draws a black rectangle at (87, 142) with width 115 and height 25.
; PLAN: r0=87(x), r1=142(y), r2=115(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 142
LDI r2, 115
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
