; DESCRIPTION: Creates a purple rectangular region at (431, 218) spanning 58 by 32 pixels.
; PLAN: r0=431(x), r1=218(y), r2=58(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 218
LDI r2, 58
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
