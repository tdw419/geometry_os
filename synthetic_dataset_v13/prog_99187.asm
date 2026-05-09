; DESCRIPTION: Draws a green rectangle at (432, 71) with width 65 and height 107.
; PLAN: r0=432(x), r1=71(y), r2=65(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 71
LDI r2, 65
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
