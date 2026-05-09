; DESCRIPTION: Creates a white rectangular region at (55, 78) spanning 92 by 47 pixels.
; PLAN: r0=55(x), r1=78(y), r2=92(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 78
LDI r2, 92
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
