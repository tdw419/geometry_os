; DESCRIPTION: Draws a white rectangle at (312, 37) with width 46 and height 24.
; PLAN: r0=312(x), r1=37(y), r2=46(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 37
LDI r2, 46
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
