; DESCRIPTION: Creates a white rectangular region at (109, 167) spanning 47 by 17 pixels.
; PLAN: r0=109(x), r1=167(y), r2=47(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 167
LDI r2, 47
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
