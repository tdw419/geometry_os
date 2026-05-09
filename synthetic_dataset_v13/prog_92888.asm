; DESCRIPTION: Creates a white rectangular region at (157, 20) spanning 58 by 107 pixels.
; PLAN: r0=157(x), r1=20(y), r2=58(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 20
LDI r2, 58
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
