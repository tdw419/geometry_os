; DESCRIPTION: Creates a black rectangular region at (397, 108) spanning 37 by 79 pixels.
; PLAN: r0=397(x), r1=108(y), r2=37(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 108
LDI r2, 37
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
