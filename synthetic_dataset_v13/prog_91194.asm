; DESCRIPTION: Creates a purple rectangular region at (45, 182) spanning 13 by 30 pixels.
; PLAN: r0=45(x), r1=182(y), r2=13(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 182
LDI r2, 13
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
