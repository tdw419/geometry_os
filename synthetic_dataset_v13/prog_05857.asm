; DESCRIPTION: Creates a blue rectangular region at (248, 185) spanning 23 by 65 pixels.
; PLAN: r0=248(x), r1=185(y), r2=23(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 185
LDI r2, 23
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
