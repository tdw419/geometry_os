; DESCRIPTION: Creates a purple rectangular region at (378, 163) spanning 59 by 40 pixels.
; PLAN: r0=378(x), r1=163(y), r2=59(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 163
LDI r2, 59
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
