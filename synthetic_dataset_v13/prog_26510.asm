; DESCRIPTION: Renders a white box of size 72x106 starting at (31, 122).
; PLAN: r0=31(x), r1=122(y), r2=72(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 122
LDI r2, 72
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
