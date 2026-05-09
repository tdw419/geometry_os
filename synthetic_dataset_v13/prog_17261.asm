; DESCRIPTION: Draws a white rectangle at (94, 189) with width 46 and height 12.
; PLAN: r0=94(x), r1=189(y), r2=46(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 189
LDI r2, 46
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
