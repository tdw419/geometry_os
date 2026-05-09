; DESCRIPTION: Draws a white rectangle at (441, 137) with width 40 and height 47.
; PLAN: r0=441(x), r1=137(y), r2=40(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 137
LDI r2, 40
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
