; DESCRIPTION: Creates a red rectangular region at (341, 118) spanning 10 by 105 pixels.
; PLAN: r0=341(x), r1=118(y), r2=10(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 118
LDI r2, 10
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
