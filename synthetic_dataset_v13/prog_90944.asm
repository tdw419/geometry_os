; DESCRIPTION: Creates a blue rectangular region at (253, 97) spanning 101 by 77 pixels.
; PLAN: r0=253(x), r1=97(y), r2=101(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 97
LDI r2, 101
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
