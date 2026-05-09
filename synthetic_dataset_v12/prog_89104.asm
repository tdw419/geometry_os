; DESCRIPTION: Creates a white rectangular region at (121, 89) spanning 82 by 81 pixels.
; PLAN: r0=121(x), r1=89(y), r2=82(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 89
LDI r2, 82
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
