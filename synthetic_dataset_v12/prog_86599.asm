; DESCRIPTION: Creates a yellow rectangular region at (322, 64) spanning 38 by 51 pixels.
; PLAN: r0=322(x), r1=64(y), r2=38(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 64
LDI r2, 38
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
