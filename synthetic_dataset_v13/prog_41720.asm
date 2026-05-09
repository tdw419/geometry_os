; DESCRIPTION: Creates a white rectangular region at (322, 81) spanning 86 by 19 pixels.
; PLAN: r0=322(x), r1=81(y), r2=86(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 81
LDI r2, 86
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
