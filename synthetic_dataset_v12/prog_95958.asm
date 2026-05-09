; DESCRIPTION: Creates a white rectangular region at (55, 71) spanning 17 by 21 pixels.
; PLAN: r0=55(x), r1=71(y), r2=17(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 71
LDI r2, 17
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
