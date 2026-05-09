; DESCRIPTION: Creates a black rectangular region at (250, 86) spanning 49 by 112 pixels.
; PLAN: r0=250(x), r1=86(y), r2=49(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 86
LDI r2, 49
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
