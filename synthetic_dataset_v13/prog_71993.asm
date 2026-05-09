; DESCRIPTION: Creates a black rectangular region at (356, 31) spanning 81 by 74 pixels.
; PLAN: r0=356(x), r1=31(y), r2=81(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 31
LDI r2, 81
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
