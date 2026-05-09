; DESCRIPTION: Draws a white rectangle at (141, 169) with width 81 and height 71.
; PLAN: r0=141(x), r1=169(y), r2=81(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 169
LDI r2, 81
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
