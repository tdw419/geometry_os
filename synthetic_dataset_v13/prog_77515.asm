; DESCRIPTION: Creates a purple rectangular region at (388, 111) spanning 37 by 15 pixels.
; PLAN: r0=388(x), r1=111(y), r2=37(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 111
LDI r2, 37
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
