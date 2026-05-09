; DESCRIPTION: Draws a black rectangle at (208, 94) with width 14 and height 53.
; PLAN: r0=208(x), r1=94(y), r2=14(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 94
LDI r2, 14
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
