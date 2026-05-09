; DESCRIPTION: Creates a blue rectangular region at (248, 29) spanning 37 by 40 pixels.
; PLAN: r0=248(x), r1=29(y), r2=37(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 29
LDI r2, 37
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
