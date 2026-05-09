; DESCRIPTION: Creates a yellow rectangular region at (95, 106) spanning 104 by 56 pixels.
; PLAN: r0=95(x), r1=106(y), r2=104(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 106
LDI r2, 104
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
