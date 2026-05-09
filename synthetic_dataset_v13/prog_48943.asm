; DESCRIPTION: Creates a purple rectangular region at (99, 156) spanning 62 by 82 pixels.
; PLAN: r0=99(x), r1=156(y), r2=62(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 156
LDI r2, 62
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
