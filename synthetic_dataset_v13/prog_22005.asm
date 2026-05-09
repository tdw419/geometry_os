; DESCRIPTION: Creates a black rectangular region at (173, 89) spanning 66 by 16 pixels.
; PLAN: r0=173(x), r1=89(y), r2=66(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 89
LDI r2, 66
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
