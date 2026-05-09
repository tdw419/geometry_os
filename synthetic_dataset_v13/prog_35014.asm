; DESCRIPTION: Draws a white rectangle at (251, 92) with width 71 and height 29.
; PLAN: r0=251(x), r1=92(y), r2=71(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 92
LDI r2, 71
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
