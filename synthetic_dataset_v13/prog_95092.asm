; DESCRIPTION: Creates a white rectangular region at (34, 13) spanning 36 by 73 pixels.
; PLAN: r0=34(x), r1=13(y), r2=36(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 13
LDI r2, 36
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
