; DESCRIPTION: Draws a white rectangle at (248, 43) with width 98 and height 80.
; PLAN: r0=248(x), r1=43(y), r2=98(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 43
LDI r2, 98
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
