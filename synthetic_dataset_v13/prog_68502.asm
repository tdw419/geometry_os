; DESCRIPTION: Creates a purple rectangular region at (11, 64) spanning 63 by 104 pixels.
; PLAN: r0=11(x), r1=64(y), r2=63(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 64
LDI r2, 63
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
