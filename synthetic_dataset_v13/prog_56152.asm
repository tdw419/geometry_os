; DESCRIPTION: Creates a white rectangular region at (157, 101) spanning 81 by 109 pixels.
; PLAN: r0=157(x), r1=101(y), r2=81(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 101
LDI r2, 81
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
