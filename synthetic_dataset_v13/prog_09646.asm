; DESCRIPTION: Creates a black rectangular region at (356, 14) spanning 86 by 87 pixels.
; PLAN: r0=356(x), r1=14(y), r2=86(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 14
LDI r2, 86
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
