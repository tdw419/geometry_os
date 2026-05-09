; DESCRIPTION: Creates a black rectangular region at (423, 79) spanning 13 by 109 pixels.
; PLAN: r0=423(x), r1=79(y), r2=13(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 79
LDI r2, 13
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
