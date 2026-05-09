; DESCRIPTION: Creates a purple rectangular region at (190, 192) spanning 65 by 46 pixels.
; PLAN: r0=190(x), r1=192(y), r2=65(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 192
LDI r2, 65
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
