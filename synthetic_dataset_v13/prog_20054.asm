; DESCRIPTION: Creates a white rectangular region at (314, 196) spanning 116 by 23 pixels.
; PLAN: r0=314(x), r1=196(y), r2=116(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 196
LDI r2, 116
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
