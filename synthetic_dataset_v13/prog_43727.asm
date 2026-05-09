; DESCRIPTION: Creates a black rectangular region at (137, 145) spanning 96 by 90 pixels.
; PLAN: r0=137(x), r1=145(y), r2=96(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 145
LDI r2, 96
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
