; DESCRIPTION: Creates a purple rectangular region at (215, 94) spanning 92 by 104 pixels.
; PLAN: r0=215(x), r1=94(y), r2=92(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 94
LDI r2, 92
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
