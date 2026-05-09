; DESCRIPTION: Draws a green rectangle at (0, 83) with width 71 and height 46.
; PLAN: r0=0(x), r1=83(y), r2=71(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 83
LDI r2, 71
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
