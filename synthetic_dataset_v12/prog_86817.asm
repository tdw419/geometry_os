; DESCRIPTION: Creates a white rectangular region at (96, 81) spanning 87 by 43 pixels.
; PLAN: r0=96(x), r1=81(y), r2=87(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 81
LDI r2, 87
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
