; DESCRIPTION: Creates a white rectangular region at (292, 124) spanning 78 by 116 pixels.
; PLAN: r0=292(x), r1=124(y), r2=78(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 124
LDI r2, 78
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
