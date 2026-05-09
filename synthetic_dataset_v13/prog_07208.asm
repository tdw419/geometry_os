; DESCRIPTION: Creates a yellow rectangular region at (218, 101) spanning 56 by 21 pixels.
; PLAN: r0=218(x), r1=101(y), r2=56(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 101
LDI r2, 56
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
