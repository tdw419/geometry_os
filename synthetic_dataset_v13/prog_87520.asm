; DESCRIPTION: Creates a black rectangular region at (364, 76) spanning 30 by 95 pixels.
; PLAN: r0=364(x), r1=76(y), r2=30(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 76
LDI r2, 30
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
