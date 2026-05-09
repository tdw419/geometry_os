; DESCRIPTION: Creates a white rectangular region at (289, 141) spanning 66 by 111 pixels.
; PLAN: r0=289(x), r1=141(y), r2=66(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 141
LDI r2, 66
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
