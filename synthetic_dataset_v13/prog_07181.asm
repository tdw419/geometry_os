; DESCRIPTION: Creates a purple rectangular region at (408, 104) spanning 76 by 116 pixels.
; PLAN: r0=408(x), r1=104(y), r2=76(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 104
LDI r2, 76
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
