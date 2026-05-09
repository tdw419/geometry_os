; DESCRIPTION: Creates a yellow rectangular region at (162, 142) spanning 97 by 104 pixels.
; PLAN: r0=162(x), r1=142(y), r2=97(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 142
LDI r2, 97
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
