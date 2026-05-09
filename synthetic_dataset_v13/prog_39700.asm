; DESCRIPTION: Creates a black rectangular region at (92, 31) spanning 71 by 35 pixels.
; PLAN: r0=92(x), r1=31(y), r2=71(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 31
LDI r2, 71
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
