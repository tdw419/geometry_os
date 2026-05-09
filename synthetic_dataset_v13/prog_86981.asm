; DESCRIPTION: Creates a black rectangular region at (48, 118) spanning 33 by 31 pixels.
; PLAN: r0=48(x), r1=118(y), r2=33(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 118
LDI r2, 33
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
