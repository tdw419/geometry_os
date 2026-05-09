; DESCRIPTION: Creates a blue rectangular region at (69, 87) spanning 107 by 88 pixels.
; PLAN: r0=69(x), r1=87(y), r2=107(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 87
LDI r2, 107
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
