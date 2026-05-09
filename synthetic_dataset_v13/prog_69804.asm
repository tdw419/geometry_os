; DESCRIPTION: Creates a black rectangular region at (322, 37) spanning 24 by 39 pixels.
; PLAN: r0=322(x), r1=37(y), r2=24(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 37
LDI r2, 24
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
