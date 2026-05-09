; DESCRIPTION: Creates a white rectangular region at (32, 90) spanning 119 by 105 pixels.
; PLAN: r0=32(x), r1=90(y), r2=119(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 90
LDI r2, 119
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
