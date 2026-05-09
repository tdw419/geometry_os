; DESCRIPTION: Draws a white rectangle at (302, 7) with width 83 and height 34.
; PLAN: r0=302(x), r1=7(y), r2=83(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 7
LDI r2, 83
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
