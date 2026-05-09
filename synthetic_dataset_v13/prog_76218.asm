; DESCRIPTION: Creates a black rectangular region at (64, 199) spanning 110 by 40 pixels.
; PLAN: r0=64(x), r1=199(y), r2=110(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 199
LDI r2, 110
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
