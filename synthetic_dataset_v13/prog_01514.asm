; DESCRIPTION: Creates a white rectangular region at (273, 153) spanning 96 by 72 pixels.
; PLAN: r0=273(x), r1=153(y), r2=96(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 153
LDI r2, 96
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
