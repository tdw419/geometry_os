; DESCRIPTION: Creates a white rectangular region at (336, 151) spanning 20 by 83 pixels.
; PLAN: r0=336(x), r1=151(y), r2=20(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 151
LDI r2, 20
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
