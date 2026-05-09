; DESCRIPTION: Creates a black rectangular region at (382, 104) spanning 87 by 65 pixels.
; PLAN: r0=382(x), r1=104(y), r2=87(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 104
LDI r2, 87
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
