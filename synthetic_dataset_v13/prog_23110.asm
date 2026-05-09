; DESCRIPTION: Creates a black rectangular region at (427, 68) spanning 27 by 116 pixels.
; PLAN: r0=427(x), r1=68(y), r2=27(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 68
LDI r2, 27
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
