; DESCRIPTION: Creates a blue rectangular region at (141, 76) spanning 56 by 109 pixels.
; PLAN: r0=141(x), r1=76(y), r2=56(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 76
LDI r2, 56
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
