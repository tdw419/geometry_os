; DESCRIPTION: Creates a black rectangular region at (427, 155) spanning 50 by 72 pixels.
; PLAN: r0=427(x), r1=155(y), r2=50(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 155
LDI r2, 50
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
