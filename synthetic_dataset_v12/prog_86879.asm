; DESCRIPTION: Creates a black rectangular region at (402, 80) spanning 86 by 72 pixels.
; PLAN: r0=402(x), r1=80(y), r2=86(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 80
LDI r2, 86
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
