; DESCRIPTION: Creates a yellow rectangular region at (218, 20) spanning 89 by 115 pixels.
; PLAN: r0=218(x), r1=20(y), r2=89(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 20
LDI r2, 89
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
