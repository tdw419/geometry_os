; DESCRIPTION: Creates a purple rectangular region at (374, 190) spanning 111 by 36 pixels.
; PLAN: r0=374(x), r1=190(y), r2=111(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 190
LDI r2, 111
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
