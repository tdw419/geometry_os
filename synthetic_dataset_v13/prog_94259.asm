; DESCRIPTION: Creates a blue rectangular region at (363, 77) spanning 45 by 65 pixels.
; PLAN: r0=363(x), r1=77(y), r2=45(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 77
LDI r2, 45
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
