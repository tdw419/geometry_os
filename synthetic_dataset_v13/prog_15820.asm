; DESCRIPTION: Renders a white box of size 35x119 starting at (133, 72).
; PLAN: r0=133(x), r1=72(y), r2=35(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 72
LDI r2, 35
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
