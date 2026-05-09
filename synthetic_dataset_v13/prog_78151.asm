; DESCRIPTION: Creates a yellow rectangular region at (322, 12) spanning 35 by 119 pixels.
; PLAN: r0=322(x), r1=12(y), r2=35(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 12
LDI r2, 35
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
