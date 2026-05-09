; DESCRIPTION: Draws a black rectangle at (217, 25) with width 80 and height 46.
; PLAN: r0=217(x), r1=25(y), r2=80(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 25
LDI r2, 80
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
