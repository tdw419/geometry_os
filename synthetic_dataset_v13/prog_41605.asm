; DESCRIPTION: Creates a black rectangular region at (178, 96) spanning 56 by 21 pixels.
; PLAN: r0=178(x), r1=96(y), r2=56(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 96
LDI r2, 56
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
