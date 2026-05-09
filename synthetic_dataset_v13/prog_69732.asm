; DESCRIPTION: Creates a purple rectangular region at (135, 182) spanning 21 by 15 pixels.
; PLAN: r0=135(x), r1=182(y), r2=21(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 182
LDI r2, 21
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
