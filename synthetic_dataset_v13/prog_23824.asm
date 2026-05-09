; DESCRIPTION: Creates a white rectangular region at (382, 76) spanning 115 by 21 pixels.
; PLAN: r0=382(x), r1=76(y), r2=115(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 76
LDI r2, 115
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
