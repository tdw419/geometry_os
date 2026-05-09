; DESCRIPTION: Creates a red rectangular region at (258, 99) spanning 106 by 52 pixels.
; PLAN: r0=258(x), r1=99(y), r2=106(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 99
LDI r2, 106
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
