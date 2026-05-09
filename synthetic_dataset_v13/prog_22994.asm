; DESCRIPTION: Creates a black rectangular region at (254, 119) spanning 80 by 32 pixels.
; PLAN: r0=254(x), r1=119(y), r2=80(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 119
LDI r2, 80
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
