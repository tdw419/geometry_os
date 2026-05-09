; DESCRIPTION: Creates a black rectangular region at (301, 5) spanning 31 by 71 pixels.
; PLAN: r0=301(x), r1=5(y), r2=31(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 5
LDI r2, 31
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
