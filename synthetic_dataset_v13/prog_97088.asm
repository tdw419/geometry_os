; DESCRIPTION: Creates a white rectangular region at (322, 92) spanning 25 by 108 pixels.
; PLAN: r0=322(x), r1=92(y), r2=25(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 92
LDI r2, 25
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
