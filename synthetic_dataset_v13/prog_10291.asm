; DESCRIPTION: Creates a purple rectangular region at (218, 124) spanning 119 by 104 pixels.
; PLAN: r0=218(x), r1=124(y), r2=119(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 124
LDI r2, 119
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
