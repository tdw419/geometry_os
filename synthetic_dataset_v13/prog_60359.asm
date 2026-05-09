; DESCRIPTION: Creates a white rectangular region at (319, 167) spanning 92 by 35 pixels.
; PLAN: r0=319(x), r1=167(y), r2=92(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 167
LDI r2, 92
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
