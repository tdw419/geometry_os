; DESCRIPTION: Creates a black rectangular region at (402, 199) spanning 39 by 15 pixels.
; PLAN: r0=402(x), r1=199(y), r2=39(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 199
LDI r2, 39
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
