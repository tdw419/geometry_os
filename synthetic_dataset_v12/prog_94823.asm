; DESCRIPTION: Creates a black rectangular region at (427, 64) spanning 79 by 84 pixels.
; PLAN: r0=427(x), r1=64(y), r2=79(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 64
LDI r2, 79
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
