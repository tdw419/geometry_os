; DESCRIPTION: Creates a yellow rectangular region at (447, 8) spanning 14 by 118 pixels.
; PLAN: r0=447(x), r1=8(y), r2=14(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 8
LDI r2, 14
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
