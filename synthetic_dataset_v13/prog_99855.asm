; DESCRIPTION: Creates a purple rectangular region at (211, 128) spanning 106 by 116 pixels.
; PLAN: r0=211(x), r1=128(y), r2=106(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 128
LDI r2, 106
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
