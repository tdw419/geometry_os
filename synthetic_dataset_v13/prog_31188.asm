; DESCRIPTION: Creates a white rectangular region at (453, 179) spanning 57 by 30 pixels.
; PLAN: r0=453(x), r1=179(y), r2=57(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 179
LDI r2, 57
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
