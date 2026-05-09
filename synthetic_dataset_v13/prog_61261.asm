; DESCRIPTION: Creates a black rectangular region at (75, 14) spanning 73 by 106 pixels.
; PLAN: r0=75(x), r1=14(y), r2=73(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 14
LDI r2, 73
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
