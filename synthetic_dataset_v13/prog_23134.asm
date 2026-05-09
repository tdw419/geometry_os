; DESCRIPTION: Draws a green rectangle at (309, 142) with width 71 and height 16.
; PLAN: r0=309(x), r1=142(y), r2=71(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 142
LDI r2, 71
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
