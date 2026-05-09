; DESCRIPTION: Creates a white rectangular region at (71, 108) spanning 52 by 46 pixels.
; PLAN: r0=71(x), r1=108(y), r2=52(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 108
LDI r2, 52
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
