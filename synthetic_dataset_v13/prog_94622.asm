; DESCRIPTION: Creates a yellow rectangular region at (254, 40) spanning 104 by 47 pixels.
; PLAN: r0=254(x), r1=40(y), r2=104(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 40
LDI r2, 104
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
