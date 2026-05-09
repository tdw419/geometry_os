; DESCRIPTION: Creates a purple rectangular region at (190, 107) spanning 37 by 87 pixels.
; PLAN: r0=190(x), r1=107(y), r2=37(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 107
LDI r2, 37
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
