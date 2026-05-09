; DESCRIPTION: Draws a red rectangle at (484, 177) with width 17 and height 66.
; PLAN: r0=484(x), r1=177(y), r2=17(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 177
LDI r2, 17
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
