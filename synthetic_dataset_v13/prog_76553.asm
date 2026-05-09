; DESCRIPTION: Creates a yellow rectangular region at (365, 88) spanning 73 by 58 pixels.
; PLAN: r0=365(x), r1=88(y), r2=73(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 88
LDI r2, 73
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
