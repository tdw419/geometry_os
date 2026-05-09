; DESCRIPTION: Creates a white rectangular region at (315, 116) spanning 29 by 88 pixels.
; PLAN: r0=315(x), r1=116(y), r2=29(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 116
LDI r2, 29
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
