; DESCRIPTION: Creates a black rectangular region at (116, 150) spanning 119 by 46 pixels.
; PLAN: r0=116(x), r1=150(y), r2=119(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 150
LDI r2, 119
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
