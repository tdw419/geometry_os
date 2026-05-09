; DESCRIPTION: Creates a purple rectangular region at (361, 102) spanning 117 by 116 pixels.
; PLAN: r0=361(x), r1=102(y), r2=117(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 102
LDI r2, 117
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
