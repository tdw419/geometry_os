; DESCRIPTION: Creates a yellow rectangular region at (410, 189) spanning 89 by 22 pixels.
; PLAN: r0=410(x), r1=189(y), r2=89(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 189
LDI r2, 89
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
