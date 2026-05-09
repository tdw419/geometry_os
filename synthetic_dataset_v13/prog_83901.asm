; DESCRIPTION: Creates a white rectangular region at (273, 10) spanning 118 by 115 pixels.
; PLAN: r0=273(x), r1=10(y), r2=118(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 10
LDI r2, 118
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
