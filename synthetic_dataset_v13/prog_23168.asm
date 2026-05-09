; DESCRIPTION: Creates a white rectangular region at (349, 39) spanning 116 by 54 pixels.
; PLAN: r0=349(x), r1=39(y), r2=116(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 39
LDI r2, 116
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
