; DESCRIPTION: Creates a purple rectangular region at (323, 163) spanning 12 by 28 pixels.
; PLAN: r0=323(x), r1=163(y), r2=12(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 163
LDI r2, 12
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
