; DESCRIPTION: Creates a white rectangular region at (305, 57) spanning 116 by 90 pixels.
; PLAN: r0=305(x), r1=57(y), r2=116(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 57
LDI r2, 116
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
