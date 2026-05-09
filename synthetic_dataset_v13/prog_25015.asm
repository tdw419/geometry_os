; DESCRIPTION: Creates a black rectangular region at (93, 234) spanning 90 by 11 pixels.
; PLAN: r0=93(x), r1=234(y), r2=90(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 234
LDI r2, 90
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
