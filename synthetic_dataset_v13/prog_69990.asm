; DESCRIPTION: Creates a black rectangular region at (164, 56) spanning 108 by 65 pixels.
; PLAN: r0=164(x), r1=56(y), r2=108(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 56
LDI r2, 108
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
