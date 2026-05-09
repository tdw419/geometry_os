; DESCRIPTION: Draws a green rectangle at (141, 193) with width 65 and height 26.
; PLAN: r0=141(x), r1=193(y), r2=65(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 193
LDI r2, 65
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
