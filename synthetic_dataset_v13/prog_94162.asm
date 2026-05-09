; DESCRIPTION: Creates a blue rectangular region at (483, 152) spanning 23 by 73 pixels.
; PLAN: r0=483(x), r1=152(y), r2=23(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 152
LDI r2, 23
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
