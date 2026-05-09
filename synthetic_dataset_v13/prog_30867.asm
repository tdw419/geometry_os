; DESCRIPTION: Creates a yellow rectangular region at (252, 207) spanning 33 by 44 pixels.
; PLAN: r0=252(x), r1=207(y), r2=33(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 207
LDI r2, 33
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
