; DESCRIPTION: Creates a black rectangular region at (212, 138) spanning 11 by 78 pixels.
; PLAN: r0=212(x), r1=138(y), r2=11(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 138
LDI r2, 11
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
