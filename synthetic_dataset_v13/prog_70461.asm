; DESCRIPTION: Draws a yellow rectangle at (251, 83) with width 58 and height 46.
; PLAN: r0=251(x), r1=83(y), r2=58(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 83
LDI r2, 58
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
