; DESCRIPTION: Creates a yellow rectangular region at (18, 185) spanning 104 by 10 pixels.
; PLAN: r0=18(x), r1=185(y), r2=104(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 185
LDI r2, 104
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
