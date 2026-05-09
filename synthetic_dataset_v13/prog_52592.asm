; DESCRIPTION: Draws a white rectangle at (222, 177) with width 31 and height 36.
; PLAN: r0=222(x), r1=177(y), r2=31(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 177
LDI r2, 31
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
