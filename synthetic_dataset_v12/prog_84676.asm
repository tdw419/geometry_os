; DESCRIPTION: Creates a black rectangular region at (110, 57) spanning 87 by 64 pixels.
; PLAN: r0=110(x), r1=57(y), r2=87(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 57
LDI r2, 87
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
