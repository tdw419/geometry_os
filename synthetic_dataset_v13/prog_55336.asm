; DESCRIPTION: Creates a black rectangular region at (301, 71) spanning 90 by 78 pixels.
; PLAN: r0=301(x), r1=71(y), r2=90(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 71
LDI r2, 90
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
