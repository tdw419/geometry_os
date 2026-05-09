; DESCRIPTION: Creates a red rectangular region at (451, 89) spanning 22 by 38 pixels.
; PLAN: r0=451(x), r1=89(y), r2=22(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 89
LDI r2, 22
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
