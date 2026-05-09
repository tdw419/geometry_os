; DESCRIPTION: Creates a white rectangular region at (319, 111) spanning 111 by 49 pixels.
; PLAN: r0=319(x), r1=111(y), r2=111(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 111
LDI r2, 111
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
