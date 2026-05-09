; DESCRIPTION: Creates a black rectangular region at (335, 79) spanning 73 by 77 pixels.
; PLAN: r0=335(x), r1=79(y), r2=73(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 79
LDI r2, 73
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
