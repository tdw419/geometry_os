; DESCRIPTION: Creates a white rectangular region at (104, 169) spanning 43 by 66 pixels.
; PLAN: r0=104(x), r1=169(y), r2=43(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 169
LDI r2, 43
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
