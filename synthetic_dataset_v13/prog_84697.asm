; DESCRIPTION: Creates a white rectangular region at (61, 110) spanning 107 by 111 pixels.
; PLAN: r0=61(x), r1=110(y), r2=107(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 110
LDI r2, 107
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
