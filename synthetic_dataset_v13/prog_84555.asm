; DESCRIPTION: Draws a green rectangle at (443, 26) with width 40 and height 106.
; PLAN: r0=443(x), r1=26(y), r2=40(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 26
LDI r2, 40
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
