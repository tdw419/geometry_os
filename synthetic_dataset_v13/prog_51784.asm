; DESCRIPTION: Draws a black rectangle at (427, 47) with width 54 and height 24.
; PLAN: r0=427(x), r1=47(y), r2=54(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 47
LDI r2, 54
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
