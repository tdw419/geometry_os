; DESCRIPTION: Creates a purple rectangular region at (374, 182) spanning 90 by 73 pixels.
; PLAN: r0=374(x), r1=182(y), r2=90(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 182
LDI r2, 90
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
