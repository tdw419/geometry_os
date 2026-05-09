; DESCRIPTION: Creates a blue rectangular region at (211, 109) spanning 97 by 69 pixels.
; PLAN: r0=211(x), r1=109(y), r2=97(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 109
LDI r2, 97
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
