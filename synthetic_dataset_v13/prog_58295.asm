; DESCRIPTION: Creates a red rectangular region at (241, 112) spanning 118 by 110 pixels.
; PLAN: r0=241(x), r1=112(y), r2=118(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 112
LDI r2, 118
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
