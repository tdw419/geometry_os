; DESCRIPTION: Draws a black rectangle at (366, 74) with width 44 and height 34.
; PLAN: r0=366(x), r1=74(y), r2=44(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 74
LDI r2, 44
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
