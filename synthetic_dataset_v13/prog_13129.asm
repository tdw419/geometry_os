; DESCRIPTION: Creates a yellow rectangular region at (37, 128) spanning 102 by 116 pixels.
; PLAN: r0=37(x), r1=128(y), r2=102(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 128
LDI r2, 102
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
