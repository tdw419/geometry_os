; DESCRIPTION: Creates a white rectangular region at (331, 95) spanning 116 by 115 pixels.
; PLAN: r0=331(x), r1=95(y), r2=116(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 95
LDI r2, 116
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
