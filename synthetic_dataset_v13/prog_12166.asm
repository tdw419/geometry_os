; DESCRIPTION: Draws a white rectangle at (302, 167) with width 46 and height 80.
; PLAN: r0=302(x), r1=167(y), r2=46(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 167
LDI r2, 46
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
