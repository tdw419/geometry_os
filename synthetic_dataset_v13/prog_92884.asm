; DESCRIPTION: Creates a purple rectangular region at (358, 32) spanning 11 by 102 pixels.
; PLAN: r0=358(x), r1=32(y), r2=11(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 32
LDI r2, 11
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
