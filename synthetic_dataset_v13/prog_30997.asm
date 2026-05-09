; DESCRIPTION: Draws a green rectangle at (456, 119) with width 10 and height 89.
; PLAN: r0=456(x), r1=119(y), r2=10(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 119
LDI r2, 10
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
