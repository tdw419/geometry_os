; DESCRIPTION: Creates a white rectangular region at (31, 108) spanning 94 by 66 pixels.
; PLAN: r0=31(x), r1=108(y), r2=94(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 108
LDI r2, 94
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
