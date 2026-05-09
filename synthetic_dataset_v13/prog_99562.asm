; DESCRIPTION: Creates a white rectangular region at (335, 178) spanning 46 by 71 pixels.
; PLAN: r0=335(x), r1=178(y), r2=46(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 178
LDI r2, 46
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
