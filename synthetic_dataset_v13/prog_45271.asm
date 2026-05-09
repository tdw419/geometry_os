; DESCRIPTION: Creates a black rectangular region at (385, 75) spanning 13 by 87 pixels.
; PLAN: r0=385(x), r1=75(y), r2=13(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 75
LDI r2, 13
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
