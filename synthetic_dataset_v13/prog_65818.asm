; DESCRIPTION: Creates a blue rectangular region at (363, 45) spanning 66 by 86 pixels.
; PLAN: r0=363(x), r1=45(y), r2=66(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 45
LDI r2, 66
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
