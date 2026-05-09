; DESCRIPTION: Creates a blue rectangular region at (11, 107) spanning 45 by 112 pixels.
; PLAN: r0=11(x), r1=107(y), r2=45(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 107
LDI r2, 45
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
