; DESCRIPTION: Creates a black rectangular region at (365, 63) spanning 17 by 22 pixels.
; PLAN: r0=365(x), r1=63(y), r2=17(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 63
LDI r2, 17
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
