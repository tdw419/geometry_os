; DESCRIPTION: Creates a purple rectangular region at (19, 107) spanning 76 by 111 pixels.
; PLAN: r0=19(x), r1=107(y), r2=76(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 107
LDI r2, 76
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
