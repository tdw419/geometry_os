; DESCRIPTION: Creates a purple rectangular region at (107, 163) spanning 111 by 36 pixels.
; PLAN: r0=107(x), r1=163(y), r2=111(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 163
LDI r2, 111
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
