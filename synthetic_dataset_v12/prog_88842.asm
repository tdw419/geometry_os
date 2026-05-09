; DESCRIPTION: Creates a white rectangular region at (227, 141) spanning 45 by 92 pixels.
; PLAN: r0=227(x), r1=141(y), r2=45(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 141
LDI r2, 45
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
