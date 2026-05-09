; DESCRIPTION: Creates a purple rectangular region at (143, 190) spanning 88 by 24 pixels.
; PLAN: r0=143(x), r1=190(y), r2=88(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 190
LDI r2, 88
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
