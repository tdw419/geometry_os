; DESCRIPTION: Creates a red rectangular region at (431, 99) spanning 31 by 81 pixels.
; PLAN: r0=431(x), r1=99(y), r2=31(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 99
LDI r2, 31
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
