; DESCRIPTION: Creates a purple rectangular region at (383, 126) spanning 99 by 107 pixels.
; PLAN: r0=383(x), r1=126(y), r2=99(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 126
LDI r2, 99
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
