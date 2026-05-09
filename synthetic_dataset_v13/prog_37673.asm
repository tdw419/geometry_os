; DESCRIPTION: Creates a purple rectangular region at (380, 32) spanning 72 by 110 pixels.
; PLAN: r0=380(x), r1=32(y), r2=72(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 32
LDI r2, 72
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
