; DESCRIPTION: Creates a white rectangular region at (382, 179) spanning 86 by 66 pixels.
; PLAN: r0=382(x), r1=179(y), r2=86(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 179
LDI r2, 86
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
