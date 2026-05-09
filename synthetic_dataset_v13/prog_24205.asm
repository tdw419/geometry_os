; DESCRIPTION: Draws a white rectangle at (36, 177) with width 80 and height 14.
; PLAN: r0=36(x), r1=177(y), r2=80(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 177
LDI r2, 80
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
