; DESCRIPTION: Draws a white rectangle at (248, 175) with width 31 and height 26.
; PLAN: r0=248(x), r1=175(y), r2=31(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 175
LDI r2, 31
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
