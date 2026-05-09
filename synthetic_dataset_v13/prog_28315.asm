; DESCRIPTION: Creates a yellow rectangular region at (110, 7) spanning 95 by 89 pixels.
; PLAN: r0=110(x), r1=7(y), r2=95(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 7
LDI r2, 95
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
