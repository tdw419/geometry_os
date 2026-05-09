; DESCRIPTION: Draws a green rectangle at (54, 146) with width 89 and height 95.
; PLAN: r0=54(x), r1=146(y), r2=89(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 146
LDI r2, 89
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
