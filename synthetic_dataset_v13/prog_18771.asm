; DESCRIPTION: Creates a white rectangular region at (353, 79) spanning 83 by 112 pixels.
; PLAN: r0=353(x), r1=79(y), r2=83(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 79
LDI r2, 83
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
