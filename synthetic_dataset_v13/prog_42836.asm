; DESCRIPTION: Creates a purple rectangular region at (74, 190) spanning 78 by 48 pixels.
; PLAN: r0=74(x), r1=190(y), r2=78(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 190
LDI r2, 78
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
