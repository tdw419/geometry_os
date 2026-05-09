; DESCRIPTION: Creates a purple rectangular region at (171, 89) spanning 56 by 104 pixels.
; PLAN: r0=171(x), r1=89(y), r2=56(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 89
LDI r2, 56
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
