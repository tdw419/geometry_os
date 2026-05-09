; DESCRIPTION: Creates a white rectangular region at (83, 167) spanning 27 by 38 pixels.
; PLAN: r0=83(x), r1=167(y), r2=27(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 167
LDI r2, 27
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
