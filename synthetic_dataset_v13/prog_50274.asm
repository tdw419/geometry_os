; DESCRIPTION: Creates a black rectangular region at (323, 135) spanning 109 by 116 pixels.
; PLAN: r0=323(x), r1=135(y), r2=109(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 135
LDI r2, 109
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
