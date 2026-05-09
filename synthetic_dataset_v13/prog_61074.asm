; DESCRIPTION: Draws a white rectangle at (92, 41) with width 87 and height 106.
; PLAN: r0=92(x), r1=41(y), r2=87(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 41
LDI r2, 87
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
