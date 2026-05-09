; DESCRIPTION: Creates a yellow rectangular region at (272, 23) spanning 92 by 118 pixels.
; PLAN: r0=272(x), r1=23(y), r2=92(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 23
LDI r2, 92
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
