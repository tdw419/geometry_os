; DESCRIPTION: Creates a black rectangular region at (259, 148) spanning 45 by 84 pixels.
; PLAN: r0=259(x), r1=148(y), r2=45(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 148
LDI r2, 45
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
