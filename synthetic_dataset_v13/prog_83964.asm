; DESCRIPTION: Creates a black rectangular region at (222, 56) spanning 61 by 22 pixels.
; PLAN: r0=222(x), r1=56(y), r2=61(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 56
LDI r2, 61
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
