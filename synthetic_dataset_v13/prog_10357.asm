; DESCRIPTION: Draws a white rectangle at (132, 182) with width 81 and height 28.
; PLAN: r0=132(x), r1=182(y), r2=81(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 182
LDI r2, 81
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
