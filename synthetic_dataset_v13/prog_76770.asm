; DESCRIPTION: Creates a black rectangular region at (382, 6) spanning 105 by 86 pixels.
; PLAN: r0=382(x), r1=6(y), r2=105(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 6
LDI r2, 105
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
