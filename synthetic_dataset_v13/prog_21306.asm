; DESCRIPTION: Creates a white rectangular region at (349, 95) spanning 88 by 106 pixels.
; PLAN: r0=349(x), r1=95(y), r2=88(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 95
LDI r2, 88
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
