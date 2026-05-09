; DESCRIPTION: Creates a black rectangular region at (250, 86) spanning 30 by 58 pixels.
; PLAN: r0=250(x), r1=86(y), r2=30(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 86
LDI r2, 30
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
