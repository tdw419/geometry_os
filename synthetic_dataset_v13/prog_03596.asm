; DESCRIPTION: Creates a white rectangular region at (73, 28) spanning 21 by 28 pixels.
; PLAN: r0=73(x), r1=28(y), r2=21(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 28
LDI r2, 21
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
