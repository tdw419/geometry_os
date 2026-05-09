; DESCRIPTION: Creates a white rectangular region at (252, 217) spanning 99 by 29 pixels.
; PLAN: r0=252(x), r1=217(y), r2=99(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 217
LDI r2, 99
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
