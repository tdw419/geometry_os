; DESCRIPTION: Creates a yellow rectangular region at (314, 63) spanning 77 by 64 pixels.
; PLAN: r0=314(x), r1=63(y), r2=77(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 63
LDI r2, 77
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
