; DESCRIPTION: Creates a white rectangular region at (322, 178) spanning 86 by 34 pixels.
; PLAN: r0=322(x), r1=178(y), r2=86(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 178
LDI r2, 86
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
