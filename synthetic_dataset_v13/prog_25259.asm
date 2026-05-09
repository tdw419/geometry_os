; DESCRIPTION: Creates a white rectangular region at (410, 24) spanning 73 by 83 pixels.
; PLAN: r0=410(x), r1=24(y), r2=73(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 24
LDI r2, 73
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
