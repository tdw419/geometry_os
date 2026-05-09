; DESCRIPTION: Creates a yellow rectangular region at (14, 105) spanning 82 by 31 pixels.
; PLAN: r0=14(x), r1=105(y), r2=82(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 105
LDI r2, 82
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
