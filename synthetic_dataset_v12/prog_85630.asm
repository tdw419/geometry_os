; DESCRIPTION: Creates a white rectangular region at (73, 107) spanning 38 by 23 pixels.
; PLAN: r0=73(x), r1=107(y), r2=38(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 107
LDI r2, 38
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
