; DESCRIPTION: Draws a black rectangle at (74, 197) with width 54 and height 23.
; PLAN: r0=74(x), r1=197(y), r2=54(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 197
LDI r2, 54
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
