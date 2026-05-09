; DESCRIPTION: Draws a blue rectangle at (195, 60) with width 41 and height 107.
; PLAN: r0=195(x), r1=60(y), r2=41(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 60
LDI r2, 41
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
