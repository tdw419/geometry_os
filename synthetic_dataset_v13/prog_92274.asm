; DESCRIPTION: Creates a yellow rectangular region at (100, 86) spanning 57 by 58 pixels.
; PLAN: r0=100(x), r1=86(y), r2=57(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 86
LDI r2, 57
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
