; DESCRIPTION: Creates a purple rectangular region at (190, 182) spanning 95 by 37 pixels.
; PLAN: r0=190(x), r1=182(y), r2=95(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 182
LDI r2, 95
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
