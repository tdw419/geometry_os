; DESCRIPTION: Creates a blue rectangular region at (112, 107) spanning 105 by 22 pixels.
; PLAN: r0=112(x), r1=107(y), r2=105(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 107
LDI r2, 105
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
