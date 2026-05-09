; DESCRIPTION: Creates a purple rectangular region at (436, 139) spanning 52 by 109 pixels.
; PLAN: r0=436(x), r1=139(y), r2=52(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 139
LDI r2, 52
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
