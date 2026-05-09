; DESCRIPTION: Creates a black rectangular region at (300, 79) spanning 36 by 58 pixels.
; PLAN: r0=300(x), r1=79(y), r2=36(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 79
LDI r2, 36
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
