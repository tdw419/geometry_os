; DESCRIPTION: Creates a red rectangular region at (336, 110) spanning 89 by 58 pixels.
; PLAN: r0=336(x), r1=110(y), r2=89(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 110
LDI r2, 89
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
