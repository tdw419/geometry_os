; DESCRIPTION: Draws a white rectangle at (364, 177) with width 99 and height 75.
; PLAN: r0=364(x), r1=177(y), r2=99(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 177
LDI r2, 99
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
