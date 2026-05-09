; DESCRIPTION: Creates a purple rectangular region at (190, 32) spanning 90 by 74 pixels.
; PLAN: r0=190(x), r1=32(y), r2=90(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 32
LDI r2, 90
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
