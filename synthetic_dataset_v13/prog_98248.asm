; DESCRIPTION: Creates a white rectangular region at (77, 14) spanning 29 by 64 pixels.
; PLAN: r0=77(x), r1=14(y), r2=29(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 14
LDI r2, 29
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
