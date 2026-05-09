; DESCRIPTION: Draws a green rectangle at (95, 43) with width 98 and height 120.
; PLAN: r0=95(x), r1=43(y), r2=98(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 43
LDI r2, 98
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
