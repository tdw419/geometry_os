; DESCRIPTION: Creates a yellow rectangular region at (400, 201) spanning 46 by 35 pixels.
; PLAN: r0=400(x), r1=201(y), r2=46(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 201
LDI r2, 46
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
