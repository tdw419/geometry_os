; DESCRIPTION: Creates a purple rectangular region at (299, 182) spanning 94 by 64 pixels.
; PLAN: r0=299(x), r1=182(y), r2=94(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 182
LDI r2, 94
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
