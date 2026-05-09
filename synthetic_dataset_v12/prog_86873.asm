; DESCRIPTION: Creates a black rectangular region at (322, 71) spanning 88 by 120 pixels.
; PLAN: r0=322(x), r1=71(y), r2=88(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 71
LDI r2, 88
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
