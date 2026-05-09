; DESCRIPTION: Renders a white box of size 43x104 starting at (427, 72).
; PLAN: r0=427(x), r1=72(y), r2=43(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 72
LDI r2, 43
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
