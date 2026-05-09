; DESCRIPTION: Creates a black rectangular region at (142, 145) spanning 79 by 45 pixels.
; PLAN: r0=142(x), r1=145(y), r2=79(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 145
LDI r2, 79
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
