; DESCRIPTION: Creates a purple rectangular region at (23, 104) spanning 52 by 109 pixels.
; PLAN: r0=23(x), r1=104(y), r2=52(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 104
LDI r2, 52
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
