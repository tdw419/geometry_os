; DESCRIPTION: Creates a black rectangular region at (301, 33) spanning 81 by 82 pixels.
; PLAN: r0=301(x), r1=33(y), r2=81(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 33
LDI r2, 81
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
