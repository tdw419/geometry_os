; DESCRIPTION: Creates a purple rectangular region at (226, 66) spanning 37 by 97 pixels.
; PLAN: r0=226(x), r1=66(y), r2=37(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 66
LDI r2, 37
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
