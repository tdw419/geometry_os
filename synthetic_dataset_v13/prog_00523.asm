; DESCRIPTION: Draws a green rectangle at (46, 83) with width 83 and height 116.
; PLAN: r0=46(x), r1=83(y), r2=83(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 83
LDI r2, 83
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
