; DESCRIPTION: Creates a yellow rectangular region at (110, 109) spanning 96 by 11 pixels.
; PLAN: r0=110(x), r1=109(y), r2=96(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 109
LDI r2, 96
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
