; DESCRIPTION: Creates a yellow rectangular region at (183, 32) spanning 73 by 79 pixels.
; PLAN: r0=183(x), r1=32(y), r2=73(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 32
LDI r2, 73
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
