; DESCRIPTION: Creates a white rectangular region at (122, 193) spanning 79 by 49 pixels.
; PLAN: r0=122(x), r1=193(y), r2=79(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 193
LDI r2, 79
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
