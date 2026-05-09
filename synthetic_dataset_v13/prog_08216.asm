; DESCRIPTION: Creates a white rectangular region at (230, 155) spanning 76 by 89 pixels.
; PLAN: r0=230(x), r1=155(y), r2=76(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 155
LDI r2, 76
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
