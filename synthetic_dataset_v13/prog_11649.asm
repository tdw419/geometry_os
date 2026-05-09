; DESCRIPTION: Creates a black rectangular region at (395, 66) spanning 108 by 32 pixels.
; PLAN: r0=395(x), r1=66(y), r2=108(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 66
LDI r2, 108
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
