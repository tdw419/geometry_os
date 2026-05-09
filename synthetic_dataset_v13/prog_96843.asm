; DESCRIPTION: Draws a green rectangle at (34, 70) with width 74 and height 73.
; PLAN: r0=34(x), r1=70(y), r2=74(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 70
LDI r2, 74
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
