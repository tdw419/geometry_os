; DESCRIPTION: Draws a green rectangle at (124, 197) with width 54 and height 41.
; PLAN: r0=124(x), r1=197(y), r2=54(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 197
LDI r2, 54
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
