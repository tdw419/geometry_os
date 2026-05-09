; DESCRIPTION: Draws a black rectangle at (227, 104) with width 120 and height 46.
; PLAN: r0=227(x), r1=104(y), r2=120(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 104
LDI r2, 120
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
