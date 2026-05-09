; DESCRIPTION: Creates a black rectangular region at (336, 23) spanning 51 by 79 pixels.
; PLAN: r0=336(x), r1=23(y), r2=51(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 23
LDI r2, 51
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
