; DESCRIPTION: Creates a purple rectangular region at (61, 97) spanning 61 by 58 pixels.
; PLAN: r0=61(x), r1=97(y), r2=61(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 97
LDI r2, 61
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
