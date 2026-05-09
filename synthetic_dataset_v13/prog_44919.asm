; DESCRIPTION: Creates a purple rectangular region at (65, 2) spanning 99 by 104 pixels.
; PLAN: r0=65(x), r1=2(y), r2=99(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 2
LDI r2, 99
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
