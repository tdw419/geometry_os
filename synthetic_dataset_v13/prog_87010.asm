; DESCRIPTION: Creates a black rectangular region at (137, 115) spanning 96 by 95 pixels.
; PLAN: r0=137(x), r1=115(y), r2=96(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 115
LDI r2, 96
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
