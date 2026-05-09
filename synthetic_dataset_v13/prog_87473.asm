; DESCRIPTION: Creates a black rectangular region at (195, 112) spanning 116 by 82 pixels.
; PLAN: r0=195(x), r1=112(y), r2=116(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 112
LDI r2, 116
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
