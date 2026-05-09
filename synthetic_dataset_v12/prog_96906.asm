; DESCRIPTION: Creates a white rectangular region at (102, 23) spanning 57 by 116 pixels.
; PLAN: r0=102(x), r1=23(y), r2=57(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 23
LDI r2, 57
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
