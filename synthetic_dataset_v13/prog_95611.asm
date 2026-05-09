; DESCRIPTION: Creates a purple rectangular region at (385, 89) spanning 32 by 45 pixels.
; PLAN: r0=385(x), r1=89(y), r2=32(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 89
LDI r2, 32
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
