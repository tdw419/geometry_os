; DESCRIPTION: Creates a blue rectangular region at (396, 45) spanning 29 by 14 pixels.
; PLAN: r0=396(x), r1=45(y), r2=29(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 45
LDI r2, 29
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
