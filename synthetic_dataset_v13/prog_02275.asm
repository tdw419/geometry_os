; DESCRIPTION: Creates a yellow rectangular region at (105, 90) spanning 52 by 73 pixels.
; PLAN: r0=105(x), r1=90(y), r2=52(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 90
LDI r2, 52
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
