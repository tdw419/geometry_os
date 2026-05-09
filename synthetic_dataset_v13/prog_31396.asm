; DESCRIPTION: Creates a white rectangular region at (226, 183) spanning 109 by 73 pixels.
; PLAN: r0=226(x), r1=183(y), r2=109(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 183
LDI r2, 109
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
