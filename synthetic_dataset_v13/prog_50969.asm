; DESCRIPTION: Creates a white rectangular region at (425, 78) spanning 79 by 57 pixels.
; PLAN: r0=425(x), r1=78(y), r2=79(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 78
LDI r2, 79
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
