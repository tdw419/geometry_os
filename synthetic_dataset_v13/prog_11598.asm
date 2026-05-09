; DESCRIPTION: Creates a black rectangular region at (322, 136) spanning 17 by 86 pixels.
; PLAN: r0=322(x), r1=136(y), r2=17(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 136
LDI r2, 17
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
