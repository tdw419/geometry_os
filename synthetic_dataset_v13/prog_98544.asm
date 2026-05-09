; DESCRIPTION: Creates a white rectangular region at (169, 109) spanning 119 by 89 pixels.
; PLAN: r0=169(x), r1=109(y), r2=119(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 109
LDI r2, 119
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
