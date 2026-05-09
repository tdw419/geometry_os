; DESCRIPTION: Creates a yellow rectangular region at (254, 89) spanning 118 by 104 pixels.
; PLAN: r0=254(x), r1=89(y), r2=118(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 89
LDI r2, 118
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
