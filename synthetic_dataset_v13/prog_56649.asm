; DESCRIPTION: Creates a black rectangular region at (170, 107) spanning 84 by 86 pixels.
; PLAN: r0=170(x), r1=107(y), r2=84(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 107
LDI r2, 84
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
