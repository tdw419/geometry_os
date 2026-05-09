; DESCRIPTION: Draws a green rectangle at (53, 120) with width 34 and height 106.
; PLAN: r0=53(x), r1=120(y), r2=34(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 120
LDI r2, 34
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
