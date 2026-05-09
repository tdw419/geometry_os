; DESCRIPTION: Creates a yellow rectangular region at (195, 73) spanning 100 by 56 pixels.
; PLAN: r0=195(x), r1=73(y), r2=100(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 73
LDI r2, 100
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
