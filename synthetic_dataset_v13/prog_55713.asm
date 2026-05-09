; DESCRIPTION: Creates a purple rectangular region at (383, 147) spanning 61 by 97 pixels.
; PLAN: r0=383(x), r1=147(y), r2=61(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 147
LDI r2, 61
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
