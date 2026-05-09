; DESCRIPTION: Creates a white rectangular region at (112, 96) spanning 72 by 107 pixels.
; PLAN: r0=112(x), r1=96(y), r2=72(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 96
LDI r2, 72
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
