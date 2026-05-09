; DESCRIPTION: Draws a green rectangle at (172, 141) with width 33 and height 87.
; PLAN: r0=172(x), r1=141(y), r2=33(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 141
LDI r2, 33
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
