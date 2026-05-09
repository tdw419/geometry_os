; DESCRIPTION: Creates a cyan rectangular region at (218, 158) spanning 22 by 89 pixels.
; PLAN: r0=218(x), r1=158(y), r2=22(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 158
LDI r2, 22
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
